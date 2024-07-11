# Use Docker to render the website

If you don't have a proper environment available to run Middleman, you can use
Docker to provide one for you locally on your machine. To have this
working correctly, you need to have at least Git and Docker installed, and an
internet connection available.

> **Note**: This repository uses `git-lfs` extension for versioning large files. Before clone you need [to install](https://git-lfs.github.com/) it.

1. Clone the repository in a local folder
   
   ```sh
   git clone git@gitlab.com:gitlab-com/www-gitlab-com.git
   ```
>  **Note**: If your git clone is timing out, update the ServerAliveInterval in ~/.ssh/config to a larger number. For example, below is the content of the ~/.ssh/config file. <br> 
> ```
> Host *
>    ServerAliveInterval 1200
>    TCPKeepAlive yes 
>    IPQoS=throughput
>```

2. Start the Docker container:

```sh 
docker run -v "$(pwd)":/usr/src/app -w /usr/src/app -p 4567:4567 -it registry.gitlab.com/gitlab-org/gitlab-build-images:www-gitlab-com-3.0 "/bin/bash"
```

3. Execute the following commands from within the container to start middleman:

```sh
bundle install 
cd sites/handbook # or "sites/uncategorized" if you are working on something else
bundle exec middleman
```

4. Connect to http://localhost:4567

> **Note**: You won't be able to connect immediately. Middleman takes a few minutes to render the site. Run `docker ps -ls` to see if middleman is still running.

5. Change your original content as usual, and see the changes in the browser as soon as
you save the new version of the file (otherwise, just restart middleman)
