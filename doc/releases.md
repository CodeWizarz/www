# Update the releases page (under `/releases`)

The releases page grabs its content automatically by crawling the blog and
retrieving the headers from the blog post.

Edit `/generators/releases.rb` and modify two elements:

1. Add the new version to the table listing the versions
    ```
    VERSIONS = [
      "8.11", "8.10", "8.9", "8.8", "8.7", "8.6", "8.5", "8.4", "8.3","8.2","8.1","8.0","7.14","7.13","7.12","7.11","7.10",
      "7.9","7.8"
    ]
    ```

2. Update the year and month according to the current date. Note that you should
only indicate a month for which we already have a public blog post announcing the
release. That means, if we are on Sept 19th and the next release scheduled for
the 22th is 8.12, the month should be 8 (i.e August for 8.11), not 9.

    ```
    year = 2016
    month = 8
    ```

3. Commit the changes.

The releases page will be updated after `bundle exec rake build`.
