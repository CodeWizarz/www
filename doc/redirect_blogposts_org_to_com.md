Redirect from gitlab.org to www.gitlab.com/ is done in `/etc/nginx/conf.d/org_to_com_rewrite_rules.rules` and included in the main nginx conf on gitlab.org server.

The redirect rules are:

```
rewrite ^/gitlab-ce/?$ https://www.gitlab.com/gitlab-ce/ permanent;
rewrite ^/gitlab-ci/?$ https://www.gitlab.com/gitlab-ci/ permanent;
rewrite ^/community/?$ https://www.gitlab.com/community/ permanent;
rewrite ^/team/?$ https://www.gitlab.com/core-team/ permanent;
rewrite ^/donate/?$ https://www.gitlab.com/contributing/ permanent;
rewrite ^/alumni/?$ https://www.gitlab.com/alumni/ permanent;
rewrite ^/screenshots/?$ https://www.gitlab.com/gitlab-ce/ permanent;
rewrite ^/index.html https://www.gitlab.com/ permanent;
rewrite ^/demo.html http://demo.gitlab.com/ permanent;
```

In sites-available:

```
  location / {
    rewrite ^/$ https://www.gitlab.com/ redirect;
  }
```


Redirect from blog.gitlab.org to www.gitlab.com/blog posts is done in `/etc/nginx/conf.d/blog_rewrite_rules.rule` and included in the main nginx conf on gitlab.org server.

The redirect code is:

```
rewrite ^/screenshots/?$ https://www.gitlab.com/gitlab-ce/ permanent;
rewrite ^/markdown-newline-behaviour/?$ https://www.gitlab.com/2014/02/21/markdown-newline-behaviour/ permanent;
rewrite ^/moved-to-dot-com/?$ https://www.gitlab.com/2014/03/07/moved-to-dot-com/ permanent;
rewrite ^/gitlab-6-dot-6-released/?$ https://www.gitlab.com/2014/02/21/gitlab-6-dot-6-released/ permanent;
rewrite ^/gitlab-book/?$ https://www.gitlab.com/2014/02/01/gitlab-book/ permanent;
rewrite ^/xss-vulnerability-in-gitlab/?$ https://www.gitlab.com/2014/01/30/xss-vulnerability-in-gitlab/ permanent;
rewrite ^/gitlab-ci-4-dot-2-released/?$ https://www.gitlab.com/2014/01/30/gitlab-ci-4-dot-2-released/ permanent;
rewrite ^/gitlab-ce-6-dot-5-released/?$ https://www.gitlab.com/2014/01/21/gitlab-ce-6-dot-5-released/ permanent;
rewrite ^/hosting-gitlab-on-gitlab/?$ https://www.gitlab.com/2014/01/07/hosting-gitlab-on-gitlab/ permanent;
rewrite ^/gitlab-ce-6-dot-4-released/?$ https://www.gitlab.com/2013/12/21/gitlab-ce-6-dot-4-released/ permanent;
rewrite ^/gitlab-ci-4-dot-1-released/?$ https://www.gitlab.com/2013/12/20/gitlab-ci-4-dot-1-released/ permanent;
rewrite ^/gitlab-ci-with-parallel-builds-and-deployments/?$ https://www.gitlab.com/2013/12/19/gitlab-ci-with-parallel-builds-and-deployments/ permanent;
rewrite ^/gitlab-ce-6-dot-3-dot-1-released/?$ https://www.gitlab.com/2013/12/05/gitlab-ce-6-dot-3-dot-1-released/ permanent;
rewrite ^/gitlab-ci-4-dot-0-released/?$ https://www.gitlab.com/2013/11/21/gitlab-ci-4-dot-0-released/ permanent;
rewrite ^/gitlab-ce-6-dot-3-released/?$ https://www.gitlab.com/2013/11/21/gitlab-ce-6-dot-3-released/ permanent;
rewrite ^/multiple-critical-vulnerabilities-in-gitlab/?$ https://www.gitlab.com/2013/11/14/multiple-critical-vulnerabilities-in-gitlab/ permanent;
rewrite ^/security-vulnerability-in-gitlab-shell/?$ https://www.gitlab.com/2013/11/08/security-vulnerability-in-gitlab-shell/ permanent;
rewrite ^/gitlab-ce-6-2-and-5-4-security-release/?$ https://www.gitlab.com/2013/11/04/gitlab-ce-6-2-and-5-4-security-release/ permanent;
rewrite ^/gitlab-ce-6-dot-2-released/?$ https://www.gitlab.com/2013/10/17/gitlab-ce-6-dot-2-released/ permanent;
rewrite ^/gitlab-community-edition-6-dot-1-released/?$ https://www.gitlab.com/2013/09/22/gitlab-community-edition-6-dot-1-released/ permanent;
rewrite ^/gitlab-6-dot-0-released/?$ https://www.gitlab.com/2013/08/20/gitlab-6-dot-0-released/ permanent;
rewrite ^/gitlab-5-dot-4-released/?$ https://www.gitlab.com/2013/07/22/gitlab-5-dot-4-released/ permanent;
rewrite ^/announcing-gitlab-enterprise-edition/?$ https://www.gitlab.com/2013/07/22/announcing-gitlab-enterprise-edition/ permanent;
rewrite ^/announcing-gitlab-ci-3.0/?$ https://www.gitlab.com/2013/07/09/announcing-gitlab-ci-3.0/ permanent;
rewrite ^/gitlab-5-dot-3-released/?$ https://www.gitlab.com/2013/06/20/gitlab-5-dot-3-released/ permanent;
rewrite ^/integrating-gitlab-ci-with-gitlab/?$ https://www.gitlab.com/2013/06/20/integrating-gitlab-ci-with-gitlab/ permanent;
rewrite ^/packaging-gitlab-for-fedora-a-gsoc-2013-project/?$ https://www.gitlab.com/2013/05/28/packaging-gitlab-for-fedora-a-gsoc-2013-project/ permanent;
rewrite ^/gitlab-5-dot-2-released/?$ https://www.gitlab.com/2013/05/22/gitlab-5-dot-2-released/ permanent;
rewrite ^/gitlab-5-dot-1-released/?$ https://www.gitlab.com/2013/04/22/gitlab-5-dot-1-released/ permanent;
rewrite ^/gitlab-ci-2-dot-2-released/?$ https://www.gitlab.com/2013/04/09/gitlab-ci-2-dot-2-released/ permanent;
rewrite ^/gitlab-5-dot-0-has-been-released/?$ https://www.gitlab.com/2013/03/22/gitlab-5-0-was-released/ permanent;
rewrite ^/gitlab-ci-version-2-dot-1-released/?$ https://www.gitlab.com/2013/03/13/gitlab-ci-version-2-dot-1-released/ permanent;
rewrite ^/donations/?$ https://www.gitlab.com/2013/03/01/donations/ permanent;
rewrite ^/gitlab-v4-dot-2-has-been-released/?$ https://www.gitlab.com/2013/02/21/gitlab-v4-dot-2-has-been-released/ permanent;
rewrite ^/gitlab-without-gitolite/?$ https://www.gitlab.com/2013/02/12/gitlab-without-gitolite/ permanent;
rewrite ^/gitlab-4-1-released/?$ https://www.gitlab.com/2013/01/22/gitlab-4-1-released/ permanent;
rewrite ^/gitlab-ci-2-0/?$ https://www.gitlab.com/2013/01/17/gitlab-ci-2-0/ permanent;
rewrite ^/gitlab-4-release/?$ https://www.gitlab.com/2012/12/23/gitlab-4-release/ permanent;
rewrite ^/gitlab-4-release-schedule/?$ https://www.gitlab.com/2012/12/20/gitlab-4-release-schedule/ permanent;
rewrite ^/gitlab-3-dot-1-release/?$ https://www.gitlab.com/2012/11/22/gitlab-3-dot-1-release/ permanent;
rewrite ^/continuous-integration-server-from-gitlab/?$ https://www.gitlab.com/2012/11/13/continuous-integration-server-from-gitlab/ permanent;
rewrite ^/gitlab-3-dot-0-released/?$ https://www.gitlab.com/2012/10/22/gitlab-3-dot-0-released/ permanent;
rewrite ^/gitlab-2-dot-9-released/?$ https://www.gitlab.com/2012/09/21/gitlab-2-dot-9-released/ permanent;
rewrite ^/news-from-the-front/?$ https://www.gitlab.com/2012/09/17/news-from-the-front/ permanent;
rewrite ^/gitlab-2-dot-8-released/?$ https://www.gitlab.com/2012/08/22/gitlab-2-dot-8-released/ permanent;
rewrite ^/gitlab-2-dot-7/?$ https://www.gitlab.com/2012/07/17/gitlab-2-dot-7/ permanent;
rewrite ^/gitlab-v2-6-released/?$ https://www.gitlab.com/2012/06/22/gitlab-v2-6-released/ permanent;
rewrite ^/gitlab-wallpaper/?$ https://www.gitlab.com/2012/06/20/gitlab-wallpaper/ permanent;
rewrite ^/merge-request-improved/?$ https://www.gitlab.com/2012/06/06/merge-request-improved/ permanent;
rewrite ^/network-graph-keyboard-navigation/?$ https://www.gitlab.com/2012/06/01/network-graph-keyboard-navigation/ permanent;
rewrite ^/gitlab-v2-5/?$ https://www.gitlab.com/2012/05/22/gitlab-v2-5/ permanent;
rewrite ^/few-screens-from-v2-5/?$ https://www.gitlab.com/2012/05/19/few-screens-from-v2-5/ permanent;
rewrite ^/gitlab-v2-4-released/?$ https://www.gitlab.com/2012/04/22/gitlab-v2-4-released/ permanent;
rewrite ^/weve-started-donation-campaign/?$ https://www.gitlab.com/2012/03/27/weve-started-donation-campaign/ permanent;
rewrite ^/gitlab-2-3-released/?$ https://www.gitlab.com/2012/03/22/gitlab-2-3-released/ permanent;
rewrite ^/migrating-to-mysql/?$ https://www.gitlab.com/2012/03/12/migrating-to-mysql/ permanent;
rewrite ^/diagnostic-tool/?$ https://www.gitlab.com/2012/03/09/diagnostic-tool/ permanent;
rewrite ^/some-screens-from-2-3pre/?$ https://www.gitlab.com/2012/03/07/some-screens-from-2-3pre/ permanent;
rewrite ^/gitlab-version-2-2/?$ https://www.gitlab.com/2012/02/22/gitlab-version-2-2/ permanent;
rewrite ^/gitlabhq-2-1-released/?$ https://www.gitlab.com/2012/01/22/gitlabhq-2-1-released/ permanent;
rewrite ^/design-changes/?$ https://www.gitlab.com/2012/01/13/design-changes/ permanent;
rewrite ^/2-1-pre/?$ https://www.gitlab.com/2012/01/05/2-1-pre/ permanent;
rewrite ^/gitlabhq-v2-0-moderno/?$ https://www.gitlab.com/2011/12/22/gitlabhq-v2-0-moderno/ permanent;
rewrite ^/useful-dashboard-first-try/?$ https://www.gitlab.com/2011/12/09/useful-dashboard-first-try/ permanent;
rewrite ^/new-access-privilegies/?$ https://www.gitlab.com/2011/12/07/new-access-privilegies/ permanent;
rewrite ^/new-commit-show-page/?$ https://www.gitlab.com/2011/12/01/new-commit-show-page/ permanent;
rewrite ^/merge-requests-v1/?$ https://www.gitlab.com/2011/11/28/merge-requests-v1/ permanent;
rewrite ^/issues-become-simplier/?$ https://www.gitlab.com/2011/11/27/issues-become-simplier/ permanent;
rewrite ^/dark-colors-for-code-review/?$ https://www.gitlab.com/2011/11/27/dark-colors-for-code-review/ permanent;
rewrite ^/issue-prototype/?$ https://www.gitlab.com/2011/11/25/issue-prototype/ permanent;
rewrite ^/whats-next/?$ https://www.gitlab.com/2011/11/23/whats-next/ permanent;
rewrite ^/pronto-released/?$ https://www.gitlab.com/2011/11/22/pronto-released/ permanent;
rewrite ^/features-for-pronto-v1-2-0/?$ https://www.gitlab.com/2011/11/17/features-for-pronto-v1-2-0/ permanent;
rewrite ^/new-feature-project-activities/?$ https://www.gitlab.com/2011/11/16/new-feature-project-activities/ permanent;
rewrite ^/new-feature-network-graph/?$ https://www.gitlab.com/2011/11/16/new-feature-network-graph/ permanent;
rewrite ^/install-guide-from-ryan-wersal/?$ https://www.gitlab.com/2011/11/08/install-guide-from-ryan-wersal/ permanent;
rewrite ^/new-design-is-coming/?$ https://www.gitlab.com/2011/11/07/new-design-is-coming/ permanent;
rewrite ^/gitlab-v1-1-vmware-image/?$ https://www.gitlab.com/2011/10/24/gitlab-v1-1-vmware-image/ permanent;
```
