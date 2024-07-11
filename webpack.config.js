// webpack.config.js
const webpack = require('webpack');
const path = require('path');
const glob = require('glob');
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CssMinimizerPlugin = require('css-minimizer-webpack-plugin');
const CopyPlugin = require("copy-webpack-plugin");
const TerserPlugin = require('terser-webpack-plugin');
const RemoveEmptyScriptsPlugin = require('webpack-remove-empty-scripts');
const VueLoaderPlugin = require('vue-loader/lib/plugin');

// Captures all scss files
const mapStylesheets = pattern => glob
  .sync(pattern)
  .reduce((entries, filename) => {
    const [, name] = filename.match(/([^/]+)\.scss$/)
    return { ...entries, [name]: filename}
  }, {})

const mapJavascripts = pattern => glob
  .sync(pattern)
  .reduce((entries, filename) => {
    const [, name] = filename.match(/([^/]+)\.js$/)
    return { ...entries, [name]: filename }
  }, {})

module.exports = {
  externals: {
    // require("jquery") is external and available
    //  on the global var jQuery
    "jquery": "jQuery"
  },
  // Catch all files within javascript and stylesheet directory
  entry: {
    ...mapStylesheets('./source/stylesheets/*.*.scss'),
    ...mapJavascripts('./source/javascripts/*.js'), // this catches all js files in /source/javascripts, output to source/javascripts/
    ...mapJavascripts('./source/frontend/bundles/*.js'), // this catches all js files in /source/javascripts, output to source/javascripts/
    'applications/broken_image_placeholder': './source/javascripts/applications/broken_image_placeholder.js',// Start  catch of source/javascripts/applications/
    'applications/categories_scroller': './source/javascripts/applications/categories_scroller.js',// will output to  be   ./dist/javascripts/applications/
  },

  output: {
    path: path.join(__dirname, '/tmp/dist'),
    filename: 'javascripts/[name].js',
  },

  resolve: {
    modules: [
      "node_modules"
    ]
  },


  module: {
    rules: [
      // Extracts the compiled CSS from the SASS files defined in the entry
      {
        test: /\.scss$/,
        use: [
          'vue-style-loader',
          {
            loader: MiniCssExtractPlugin.loader
          },
          {
            // Interprets CSS
            loader: "css-loader",
            options: {
              importLoaders: 2
            }
          },
          {
            loader: 'sass-loader' // 将 Sass 编译成 CSS
          }
        ],
      },
      // Process Vue
      {
        test: /\.vue$/,
        use: [
          'vue-loader',
        ]
      },
      {
        test: /\.css$/,
        use: [
          'vue-style-loader',
          'css-loader'
        ]
      }
    ],
  },

  plugins: [
    // Where the compiled SASS is saved to
    // Note: If [name].css is included in filename it outputs .css.css for css.scss files
    // Todo: [name] will not capture just filename.scss files such as blog-landing.css

    new MiniCssExtractPlugin({
      filename: "stylesheets/[name]",
      chunkFilename: "stylesheets/[name].css"
    }),
    // Removes js files produced from scss compiling
    new RemoveEmptyScriptsPlugin(),
    // Just copy the javascript libraries for now because we're not bundling them.
    new CopyPlugin({
      patterns: [
        {
          from: "libs/*.js",
          to: "javascripts/",
          context: "source/javascripts",
        },
      ],
    }),
    // Vue
    new VueLoaderPlugin()
  ],
  // Compresses javascript files
  optimization: {
    minimizer: [
      new CssMinimizerPlugin(),
      new TerserPlugin()
    ]
  },

  stats: {
    entrypoints: false,
    children: false
  },

  // Dev Server configuration
  // Read more in doc/webpack.md
  devServer: {
    compress: true,
    host: '0.0.0.0', // specify this to make the web server accessible internally. https://webpack.js.org/configuration/dev-server/#devserverhost
    port: 4567, // This is Middleman's default port, which we use so the dev experience doesn't change.
    proxy: {
      '/': 'http://localhost:7654'
    },
  }
};
