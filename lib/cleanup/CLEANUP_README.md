## Disclaimer

* See https://gitlab.com/gitlab-com/www-gitlab-com/-/issues/5525 for much more context.
* The scripts in this `cleanup` directory were developed without tests, to quickly iterate towards a first-time cleanup of the `www-gitlab-com` MRs and branches in early 2020.
* They were are not documented other than the issue and MRs, but file, class, and variable named are hopefully descriptive enough to understand them, and the MRs contain the command lines invocations used in most cases.
* They are controlled by environment variables which are named descriptively, and in most cases should raise an exception if a required var is not set.
* These scripts worked for the initial cleanup, but subsequent changes may have caused regressions or bugs.
* If they need to be run again, you can run them against a test repo to understand them and endure they work.
