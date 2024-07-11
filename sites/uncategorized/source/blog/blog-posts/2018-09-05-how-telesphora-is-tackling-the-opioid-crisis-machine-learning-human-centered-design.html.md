---
title: "How Telesphora is tackling the opioid epidemic with machine learning and human-centered design"
author: Erica Lindberg
author_gitlab: erica
author_twitter: EricaLindberg_
categories: insights
image_title: '/images/blogimages/telesphora/telesphora-team.jpg'
description: "GitLab users Jack Cackler and Frank Lee explain how they use predictive analytics to empower community stakeholders, like first responders and policy makers, to save lives."
tags: user stories, AI/ML
twitter_image: '/images/blogimages/telesphora/telesphora-team.jpg'
twitter_text: "How Telesphora is tackling the opioid epidemic with #MachineLearning and #HumanCenteredDesign"
---

On average, [115 Americans die every day](https://www.cdc.gov/drugoverdose/epidemic/index.html) from an opioid overdose. The team at [Telesphora](https://telesphora.com/) is on a mission to help health care professionals and local communities change that.

In 2017, the United States Department of Health and Human Services (HHS) declared the current opioid crisis a public health emergency as the number of [deaths involving opioids](https://www.drugabuse.gov/related-topics/trends-statistics/overdose-death-rates) in the United States skyrocketed from approximately 10,000 in 2002 to an estimated 49,000 in 2017.
In response to the crisis, the HHS released a [five-point strategy](https://www.hhs.gov/opioids/about-the-epidemic/hhs-response/index.html) for fighting the opioid epidemic. Among the key priorities you’d expect to see from a health crisis report (e.g. better prevention, treatment, and recovery services; better pain management) is **better data**, and they’ve turned to computer and data scientists for help.

![US map of opioid epidemic](/images/blogimages/telesphora/us-map-crisis.jpg){: .medium.center}
*<small>In 2016, the number of overdose deaths involving opioids was 5 times higher than in 1999.</small>*

## Designing for people

Jack Cackler is a machine learning specialist. Frank Lee is a pain management specialist. Under typical circumstances, these two may have never met. But when the HHS decided to hold an unprecedented [national opioid crisis code-a-thon](https://www.hhs.gov/challenges/code-a-thon/index.html), they didn’t just enlist developers – they brought in stakeholders from every side of the issue to develop data-driven solutions to combat the opioid epidemic across three tracks: treatment, usage, and prevention.

[Origami Innovations](https://origamiinnovations.com/), a design, innovation, and solution lab powered by a Yale University students, was invited to the code-a-thon, bringing Cackler, Lee, and co-founders Matthew Erlendson, fourth-year medical student at Yale University and founder of Origami Innovations, and Dara Rouholiman, a digital health, data, and machine learning consultant together for the time. After winning the Treatment Track and receiving a $10,000 prize, they formed Telesphora, a human-centered data science platform.

“One of the things that we were involved with was coming up with the core themes for the hackathon,” said Frank Lee, co-founder of Telesphora. “One of the ways that we do that is by human-centered design thinking.”

Human-centered design is an approach to design that considers the human perspective in every step of the problem-solving process. As Jack Cackler, co-founder at Telesphora, explains, “Sometimes, especially for those with a technical background, there’s a tendency to just focus on a technical solution. We really tried to get the story behind how this [opioid crisis] really impacted people.”

> "There’s a tendency to just focus on a technical solution. We really tried to get the story behind how this [opioid crisis] really impacted people.”

Cackler and team knew they wanted to design a human-centered solution. Discovering that the stigma of chronic opioid use was preventing treatment, they started asking questions:

- *How might we treat this like a disease to reduce stigma, taking an empathetic approach similar to outbreaks of the flu or STDs?*
- *How might we better predict community outbreaks?*
- *How might we contain high mortality outbreaks, such as bad batches of drugs, to save lives in real time?*

“We involved all the stakeholders in the crisis, which includes not only the providers, the scientists, and the administrators of the local and the state regions, but also the patients and families of patients who are affected by the overdose,” said Lee. “After doing a lot of brainstorming with these participants, we knew there needed to be better communication between first responders. We aimed our solution toward first responders and how they can help each other better allocate resources to help with the overdoses.”

## Empathy over stigma

On June 23, 2016 in New Haven, Connecticut, where many on Cackler and Lee’s code-a-thon team called home, 12 patients, found within a one-block radius, were taken to Yale New Haven Hospital for opioid overdose. Three lost their lives due to a shortage of the drug Narcan (naloxone), a drug that can treat an opioid overdose to prevent death; the shelf life is short and the cost is high.

Part of the problem, according to Lee and Cackler, is that there’s a common assumption that there’s a uniform distribution of overdoses, therefore, you can accommodate the demand. However, data analysis and conversations with first responders show that overdoses happen in spikes, like the event in New Haven.

“There will be a new distribution channel of some opioid in some city. And then all of a sudden, you'll have a dozen, two dozen overdoses in a weekend, and there's just no way that the ambulances in the city can service that demand,” said Cackler. If the outbreak in New Haven could have been predicted, health agencies could have prepared and saved lives.

![telesphora interface](/images/blogimages/telesphora/hhs1.png){: .medium.center}
*<small>Telesphora is a platform that uses real-time, open-access data and machine learning to predict where and when increases in opioid overdose and mortality will occur.</small>*

The solution Cackler, Lee, and the team came up with, now Telesphora, aimed to do just that. Using real-time data and future-trend data, they built a platform that empowers communities to predict outbreaks, increases access to treatment and resources, and reduces the stigma of opioid use.

## Predictive analytics and user-friendly tools save lives

Knowing that if an overdose outbreak is predicted before it happens, life-saving medicine can be allocated to the soon-to-be affected area to save lives, the Telesphora team used predictive analytics and user-friendly design to build a projection model and visualize the data.

> "If the outbreak in New Haven could have been predicted, health agencies could have prepared and saved lives."

Starting with historical overdose data and network analysis of supply movements and overdoses, they created a spatiotemporal Poisson process to project future opioid overdose trends at any given space and time. The Poisson process takes real-time data and uses the geographic information, temporal information, and type of drug to predict the movement of opioids, alerting local responders and authorities of a potential overdose outbreak before it happens, bringing response time and mortality rate down.

“The first alerts in this model come from neighboring cities in a flurry of mortality rate. Our tool with a geospatial analysis can predict the movement of spikes. When you see a spike in fentanyl in New Haven, CT, 4.8 days later you’ll see a spike happen in Fairfield,” Cackler explains.

![machine learning explanation](/images/blogimages/telesphora/machine-learning.jpg){: .medium.center}
*<small>The machine learning model predicts the movement of outbreaks based on surrounding counties.</small>*

When an outbreak is detected, it appears as a spike on the graph and the model can correlate that spike to different regions, alerting communities to how many days until that outbreak affects their area. The data visualization makes it easy for end users, like first responders, to digest the numbers and trends, showing the actual and predicted data across different regions, and the ability to filter by different drugs.

“If we had this model a year before, events like what happened in New Haven could have been predicted. I think that’s really impactful and you can see in a tangible way how this is actionable,” said Cackler.

*Are you using machine learning or human-centered design to build actionable solutions for the future? We want to hear from you! Email content@gitlab.com.*

All images courtesy of Telesphora
{: .note}
