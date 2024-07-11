www.gitlab.com is a static site but we require two dynamic pages, for 2 subscriptions we have.
To [integrate recurly.js](https://docs.recurly.com/api/recurlyjs/integration) we are using [recurly ruby client library](https://docs.recurly.com/client-libraries/ruby).
To generate the dynamic pages we will be using a small sinatra app and this will allow us to generate the required signature and populate the forms.

In order to use the sinatra application for the first time, couple of things are needed:

1. Populate `recurly/config.yml` with correct Recurly credentials
1. Copy the startup script to `/etc/init.d/recurly` from `source/_support/recurly`. Make sure it is executable.
1. Use the nginx config example from `source/_support/nginx`
1. Make sure that `recurly/start_recurly.rb` is accessible to user running nginx (`chmod 755`)
1. Create directory that will hold pid files, `/opt/recurly/pids` and make the pids owned by the user that will run it (`www-data`)
1. Start Recurly process: `sudo /etc/init.d/recurly start`
1. Configure the Recurly process to start at boot: `sudo update-rc.d recurly start 20 2 3 4 5 .`

[Daemonize gem](http://daemons.rubyforge.org/) will make sure that the sinatra app is always running because it starts the app if it is not running.
