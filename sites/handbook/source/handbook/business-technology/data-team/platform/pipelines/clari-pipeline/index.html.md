---
layout: handbook-page-toc
title: "Clari data pipeline"
description: "The Clari data pipeline extracts data from the API via custom script and uploads it into Snowflake."
---

The Clari data pipeline extracts data from the API via custom [script](https://gitlab.com/gitlab-data/analytics/-/blob/master/extract/clari/src/clari.py) and uploads it into Snowflake.

This page documents some specifics such as:
- API endpoints used
- daily and quarterly DAG design
- Late Updated records

### API process
The Clari [API](https://developer.clari.com/default/documentation/external_spec) has two *forecast* endpoints.

Correspondingly, there are two DAG's that call each endpoint (described in more detail below in 'DAG' section.

Both endpoints return a final JSON object that is uploaded to Snowflake.

#### Current week forecast endpoint
The [/forecast/{forecastId}](https://developer.clari.com/default/documentation/external_spec#/Forecast%20API/externalFcwResource) endpoint accepts a `timePeriod` parameter which is the quarter in which to return data. 

Regardless of which quarter is requested, the endpoint only returns the latest week available for that quarter. 

The 'Daily' DAG uses this endpoint.

#### Historical forecast endpoint
To get 'historical' data, 3 endpoints need to be called
1. [export endpoint](https://developer.clari.com/default/documentation/external_spec#/Forecast%20API/externalFcwExport): start the `net_arr` export
    - Like the previous endpoint, this one takes in a quarter parameter
2. [job status endpoint](https://developer.clari.com/default/documentation/external_spec#/Export%20API/jobStatus): poll until the job is 'DONE'
3. [results endpoint](https://developer.clari.com/default/documentation/external_spec#/Export%20API/externalExportDownload): returns the report as a JSON object

This endpoint is different from the previous one because it returns every week of the quarter, not just the latest week.

Called by the 'Quarterly' DAG.


## Backfills
Backfills are strongly **discouraged/prohibited**. 

The Clari API forecast endpoint is NOT idempotent, that is, there is no guarantee that calling the endpoint with the same parameters will generate the same result.

Support has confirmed the following: 
*Clari historical export does not provide historical entries from users who are not currently in the forecast opted-ins.*

That means regardless of the quarter, a forecast is generated only, and for only **currently active** employees. Once an employee becomes inactive, it is no longer possible to retrieve their previously forecasted values from the API.

Since backfills are discouraged, there is no mechanism provided to retrieve data prior to the DAG start_date.

#### Static Data
In place of backfilling, historical data (data before `FY23-Q4`) will instead be based on data obtained from the old `driveload` process, which uploads the data to the Snowflake table 'PROD.legacy.driveload_clari_export_forecast_net_iacv'.

The data in prod was transformed once to conform to the API formatting and is saved in `static.sensitive.wk_sales_clari_net_arr_forecast_historical`. This table serves as the historical data and is used by dbt downstream models.

## DAG's

### Daily DAG
The Daily DAG has the following attributes:
1. Calls the 'current week forecast' endpoint
    - The reasoning behind using the current week forecast is to prevent needlessly including duplicates for that quarter.
1. is scheduled to run daily at 8:00am UTC to ensure that the latest updates (discussed in more detail later section) have been captured, but before the dbt-run has started. 
1. The Daily DAG will use the `{{ execution_date }}` for the fiscal quarter, this will correspond to **yesterday's** fiscal quarter.

### Quarterly DAG
The Quarterly DAG has the following attributes:
1. Calls the 'historical forecast' endpoint
1. The Quarterly DAG is scheduled to run on the first day of each GitLab quarter, i.e Feb, Apr, Aug, Nov. At 8:05am to ensure it finishes prior to dbt-run job, but starts slightly after the daily run so that it has a later 'uploaded_at'

It will consist of two tasks:
- Previous quarter
    - It will use the ` {{ execution_date }} `, which means the fiscal_quarter will correspond to the **previous quarter**.
    - This is necessary to refresh any records that were updated. There is a corner-case for a small subset of records where the previous week's data is updated on the first day of the new week. This is explained in more detail within the 'Updated Records' section.
- New quarter: 
    - It will use the ` {{ next_execution_date }} `, which means the fiscal_quarter will correspond to the **current quarter**.
    - This is necessary to capture all weeks of the new quarter. The first week of entries returned by the API unintuitively starts prior to the actual quarter start date. By the time it's a new quarter, the API will be returning week 2 entries for that quarter.
        - As an example, 'Week 1' of Q1 might begin on Jan 25, rather than the expected Feb 1st, and you may lose that first week if 'isHistorical=False'.


Originally, the quarterly DAG was also created for backfills, all that needs to be done is to set the `start_date` of the DAG to when the user wants to start backfilling, but as discussed above, backfills should not be done.

### Updated records
Records can be updated up till 8:00am UTC of the next day. This is generally of no concern because the daily DAG would capture these changes.

However, there is a chance that data is updated one day after the record's 'week_end_date'. The daily DAG wouldn't capture this record because it only returns the current week, which would be the next week already.

Here's an example:

```sql
SELECT
 time_frame_id,
  '2022-12-07' week_start_date,
  '2022-12-13' week_end_date,
  updated_on
FROM
  PREP.CLARI.NET_ARR_ENTRIES
WHERE
  time_frame_id = 'TF:2022-12-07'
  AND user_id = '280627:00E4M000001RgqRUAS'
  AND field_id = 'fc_net_commit';
```

This is a small edge-case that only effects a few records each quarter. The quarterly DAG accounts for as it runs the entire quarter one day after the quarter ends.

