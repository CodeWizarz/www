# Webpack Asset Build

## What is it
Webpack has been added to the www-gitlab-com repo to compile and build assets for the static website during a build. We are using the Middleman external asset pipeline to do this. Here are some helpful links: 
https://middlemanapp.com/advanced/external-pipeline/

## Where is it
The webpack build is located at the root directory of the repository and located at webpack.config.js.

## Production build
During a production build of the website, we use a CI job to run webpack and build assets with yarn. 


## How to test locally
Running a middleman locally from the `/sites/handbook/` or `/sites/uncategorized/` site will invoke the webpack build automatically. You can test just running webpack without middleman by using the following command from the project root: `yarn run build-webpack`

## Webpack DevServer

We can use [webpack-dev-server for local development](https://webpack.js.org/guides/development/#using-webpack-dev-server). It provides a simple web server with live reloading, and many additional options for developer ergonomics. The main advantage of using webpack-dev-server as opposed to Webpack's [watch mode](https://webpack.js.org/guides/development/#using-watch-mode) is that devServer doesn't write output to disk, and instead serves Webpack output from memory. That's faster than writing to disk, which watch mode does. 

The DevServer configuration lives in the `devServer` key in `webpack.config.js`, 
and we can modify its [options there](https://webpack.js.org/configuration/dev-server/). 

As of 2021-01-12, there seems to be confusion between the terms [devServer](https://webpack.js.org/configuration/dev-server/), [webpack-dev-server](https://webpack.js.org/guides/development/#using-webpack-dev-server), and [webpack serve](https://www.npmjs.com/package/@webpack-cli/serve). This stems from the migration to Webpack v5.

We have a script in `package.json` called `start-webpack`, which uses the `webpack` command (referring to `webpack-cli`)[https://webpack.js.org/api/cli/] and passes it the `serve` option, which uses [webpack-dev-server](https://webpack.js.org/guides/development/#using-webpack-dev-server). In the previous version of Webpack CLI, this command used the [@webpack-cli/serve](https://www.npmjs.com/package/@webpack-cli/serve) package instead. 

### DevServer Configuration

The devServer configuration is listed in the `devServer` key in `webpack.config.js` ([options reference](https://webpack.js.org/configuration/dev-server/)).

### Using DevServer and Middleman

The [Middleman external pipeline](https://middlemanapp.com/advanced/external-pipeline/) allows us to integrate Webpack with the Middleman build step. This happens in the individual Middleman configuration files: 

* `sites/uncategorized/config.rb`
* `sites/handbook/config.rb`

By default, when we add the external pipeline like this, it adds the Webpack output to the Middleman [sitemap](https://middlemanapp.com/advanced/sitemap/). It also requires us to specify directories written to disk. That means when the webpack bundle changes, the Middleman server rebuilds the entire site, which is unnecessary in development mode if we have Webpack set up to rebuild as well, and it takes a long time. 

Moreover, since Middleman requires us to point its external pipeline to a directory on disk, this only works with [watch mode](https://webpack.js.org/guides/development/#using-watch-mode), since that actually writes to disk, and devServer does not. 

Another wrench in the process is that Middleman implicitly adds the `source/javascripts` and `source/stylesheets` directories to its sitemap. So any modification there triggers the rebuild as well as the Webpack rebuild (and therefore a third rebuild of Middleman, watching the Webpack output change once more). 

So when it comes to files processed by Webpack, we want *webpack, and only webpack* to handle them, and we want Middleman to know nothing about them, other than the references to their URLs in the codebase.

Therefore, we ask Middleman to ignore its implicit sitemap build of the `source/javascripts` and `source/stylesheets` directories like so: 

```rb
# sites/handbook/config.rb, sites/uncategorized/config.rb, any other config
# ...
ignore 'javascripts/*'
ignore 'stylesheets/*'
# ...
```

Then we configure the external pipeline to use webpack and point it to `/tmp/dist`, which is where Webpack *would* write files if we used watch mode, but should be static while devServer does its thing.

```rb
# ...
activate :external_pipeline,
    name: :webpack,
    command: "cd #{monorepo_root} && yarn run start-webpack",
    source: "#{monorepo_root}/tmp/dist",
    latency: 3
# ...
```

At this stage, devServer controls all of the webpack files, and Middleman knows nothing about them. But because of that, they are *missing* from the Middleman server process in-memory. 

We can't bind both the devServer and Middleman server to the same port, and since our assets are spread through the repository, it would be a far reaching and challenging change to point to something like `webpack-server-address:webpack-port/javascripts` and `webpack-server-address:webpack-port/stylesheets` for development mode. If we clean up our references and bundle all of Webpack's output, we could do something like that. 

But to keep the development environment the same, we use the [devServer proxy](https://webpack.js.org/configuration/dev-server/#devserverproxy) and proxy *everything* through devServer to Middleman, like so: 

```js
devServer: {
    index: '',
    port: 4567, 
    proxy: {
        '/': 'http://localhost:7654'
    }
}
```

To allow a root proxy, we have to set the `index` value to something falsey, like an empty string. 

We set the `port` to 4567, which is Middleman's default port. And finally, in the Middleman config, we set Middleman to run on port 7654 (but only in the development task that uses Webpack devServer).

### Other DevServer notes

* [webpack-fix-style-only-entries is incompatible with Webpack 5](https://github.com/fqborges/webpack-fix-style-only-entries/issues/31#issuecomment-729158992), so we have to use [this fork](https://github.com/webdiscus/webpack-remove-empty-scripts) instead.
* `webpack.config.js` now has a configuration dependency on the Middleman configuration, since it expects a server running on `localhost:7654` for its proxy. As the monorepo grows/changes and technology changes, this will not be the correct choice for every sub-project. In the future, we may look to [multiple configurations](https://webpack.js.org/configuration/configuration-types/#exporting-multiple-configurations) if we want to share this one webpack config file across sites in the monorepo. 
* The Middleman preview server logs its own port to the console, instructing users to hit `localhost:7654` when the external pipeline is enabled. We use an extension in `extensions/proxy_server_information.rb` to print a custom message about this _above_ the now-incorrect message. There is no useful lifecycle hook that gives us the ability to print a message directly after the incorrect messages. We *could* monkey-patch the `start` method of `Middleman::PreviewServer`, but that is a lot just to reverse the order of these messages.

### Webpack Gotchas

#### Unused variables get dropped

In our initial migration to Webpack, we had an issue where [webpack would not copy certain JS files because it parsed them as unused variables](https://gitlab.com/gitlab-com/www-gitlab-com/-/merge_requests/72789#note_494547849). 

If you write JavaScript to be compiled through Webpack and it gets parsed as an [unused variable](https://eslint.org/docs/rules/no-unused-vars), the file will get stripped through [Webpack's tree shaking](https://webpack.js.org/guides/tree-shaking/) 

As an example: 

```js
// source/javascripts/unused.js

// An unused variable - only ever assigned, never used elsewhere.
var unused_var = 42;

// Write-only variables are considered unused 
var y = 10;
y = 5;

// A read for a modification of itself is considered unused
var z = 0;
z = z + 1;

// Hoisted functions are considered unused 
function unused() {
    return 5;
}

// Functions declared as variables are considered unused 
var unusedAnonymousFunction = function () {
    var element = document.getElementById("someTarget");
    element.classList.add("active");
}
```

Will get packed as an empty file at `tmp/dist/javascripts/unused.js`. 

If you do really want to set a global variable and use it somewhere outside of the Webpack processed JavaScript (like in a template, for example), you can assign them to the `window` object, or call them if they're a hoisted function

```js
// source/javascripts/unused.js

// An unused variable - only ever assigned, never used elsewhere.
var unused_var = 42;

// Write-only variables are considered unused 
var y = 10;
y = 5;

// A read for a modification of itself is considered unused
var z = 0;
z = z + 1;

// Hoisted functions are considered unused 
function unused() {
    return 5;
}

// Functions declared as variables are considered unused 
var unusedAnonymousFunction = function () {
    var element = document.getElementById("someTarget");
    element.classList.add("active");
}

window.unused_var = unused_var
window.y = y 
window.z = z
window.unusedAnonymousFunction = unusedAnonymousFunction
unused();
```

Which will generate this output (it will be minified, but we have beautified it here for reference). 

```js
// tmp/dist/javascripts/unused.js

(() => {
    // Author's note: auto generated by Webpack for the `z` variable
    var n = 0;
    n += 1;
    window.unused_var = 42, window.y = 5, window.z = n, window.unusedAnonymousFunction = function() {
        document.getElementById("someTarget").classList.add("active")
    }, window.unused = function() {
        return 5
    }
})();
```

#### devServer process persists in the background

When you run the Middleman preview server via `bundle exec middleman serve`, the Webpack devServer starts on a separate process. Usually if you shut down the Middleman server with `Ctrl+C`, both the Middleman process and the Webpack process shut down. 

However, there is a [longstanding, known bug](https://github.com/webpack/webpack-dev-server/issues/1479) in which the devServer does not appropriately kill its process on a `SIGTERM`. This problem has been reported by others as recently as [2021-02-02](https://github.com/webpack/webpack-dev-server/issues/2986), and is not yet resolved. 

If this happens to you after you shut down the Middleman preview server, the next time you start it, you may see an `EADDRINUSE` warning. If that's the case, the old Webpack devServer process is still bound to port `4567`, and is likely serving up stale bundles. Some of your changes may not be reflected, particularly changes made to new files (since the initial Webpack devServer process was not watching that non-existent file). Other unexpected behavior may occur. 

If you see `EADDRINUSE` when you start the Middleman preview server, exit out of the process, and then kill any processes running on port `4567`, which you can do with the following command: 

```sh
kill $(lsof -t -i:4567)
```

This should resolve the issue. 
