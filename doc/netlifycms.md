# Netlify CMS

## What is it?

[Netlify CMS](https://www.netlifycms.org/) is a git based headless CMS system. It is a React app wrapper around the files in the Git repository that creates a user friendly UI for editing content in a git-based static site generator, like our site. 

We define structured content and provide that definition to Netlify CMS, which can interpret our content configuration and generate the user friendly UI for others to create and edit content in a more familiar environment to them. 

We can pull that content into our templating system, again based on the definition of the structured content, and build the static site as per usual. 

## Where is it? 

You can find all of the Netlify CMS configuration in `sites/uncategorized/source/admin/`. There you'll find three files: 

1. `config.yml`: this YAML file manages the entire [Netlify CMS configuration](https://www.netlifycms.org/docs/configuration-options/#configuration-file). 
1. `index.html`: this is the entrypoint for the Netlify CMS React app, which gets pulled in via CDN. 
1. `preview.js`: this is the only dependency *note* pulled in from Netlify's CDN. Here we can define and style the preview panel that displays on the right side of the UI. 

## How can I use it locally?

As of now, you can only access Netlify CMS while [working locally with the repository](https://www.netlifycms.org/docs/beta-features/#working-with-a-local-git-repository). Technically this feature is in beta (as of 2021-01-14), so things may change rapidly.

1. Run `npx netlify-cms-proxy-server` from the **root directory** of the repository to start the Netlify CMS proxy server. If you run this command from elsewhere, the relative filepaths will be broken and the admin panel won't work as expect (or at all).
1. Run `NO_CONTRACTS=true bundle exec middleman` from the `sites/uncategorized` directory of the repository to start the Middleman server. Note: adding a `--verbose` flag can be helpful for identifying bugs. 
1. Visit http://localhost:4567/admin/ (don't forget the trailing slash!)
1. From the admin screen, you'll be able to create and edit content as defined in the Netlify CMS settings. 

[Watch the CMS content migration video for hands-on guidance](
https://www.youtube.com/watch?v=lUFCjeVcsx4)

## How can I use it on about.gitlab.com?

Just visit [https://about.gitlab.com/admin/](https://about.gitlab.com/admin/)

We're using the [web application flow](https://www.netlifycms.org/docs/gitlab-backend/#web-application-flow-with-netlify) for authentication.

## Can multiple users draft, review, and approve posts? 

Netlify CMS calls this [editorial workflow](https://www.netlifycms.org/docs/add-to-your-site/#editorial-workflow), and support for this feature with GitLab repositories is [in beta](https://www.netlifycms.org/docs/beta-features/#gitlab-and-bitbucket-editorial-workflow-support). 

## How do we define our content with Netlify CMS? 

We define editable content through [collection types](https://www.netlifycms.org/docs/collection-types/). 

We currently have two collection types: 

1. topic
1. blog_news

Both of which are [folder collections](https://www.netlifycms.org/docs/collection-types/#folder-collections), which means they use the same format, fields, and configuration - tied together in a shared date folder (i.e. `data/topic/`).

## Where is the content stored? 

Content for Topic pages editable by Netlify CMS are stored in `/data/topics` as `yml` files.

Content for Blog posts editable by Netlify CMS are stored in `/sites/uncategorized/source/blog/blog-posts/` as `.html.md` files.

## How do media files get stored? 

We use the [folder collections media and public folders](https://www.netlifycms.org/docs/beta-features/#folder-collections-media-and-public-folder) (beta) to manage media files, but there is a default, global `media_folder` directory as well for collections that do not define their own. 

Eventually, we may want to integrate [Cloudinary](https://www.netlifycms.org/docs/cloudinary/#header), since Netlify CMS explicitly recommends it. However, at the moment there is [an ongoing tool evaluation for a digital asset management platform](https://gitlab.com/gitlab-com/uncategorized/uncategorized-operations/-/issues/2454). 

## How does the templating architecture work?

In Middleman, we [define proxies](https://middlemanapp.com/advanced/dynamic-pages/#defining-proxies) to generate dynamic pages. 

Through this process, we can use [data files](https://middlemanapp.com/advanced/data-files/#main) to represent the structured data Netlify CMS can manipulate, and pass it to the appropriate template. 

You can find specific proxy definitions for the uncategorized site in `sites/uncategorized/config.rb`, like the current proxy for topics:

```rb
# Proxy topic study pages
data.topic.each do |filename, topic|
  proxy "/topics/#{filename}/index.html", '/templates/topic_detailed.html', locals: { topic: topic }
end
```
For the blog, we use `format: frontmatter` to enable Netlify CMS to [edit markdown files](https://www.netlifycms.org/docs/configuration-options/#extension-and-format). This parses files and saves files with data frontmatter followed by an unparsed body text (edited using a body field); saves with md extension by default. We are enabling collections of blog post iteratively by category.

## How do I create a new content type to be editable in Netlify CMS?

The first step to creating new content types is to define a new [collection](https://www.netlifycms.org/docs/configuration-options/#collections) in `sites/uncategorized/source/admin/config.yml`. 

If you are migrating existing content to a new Netlify CMS content type, you will want to abstract the content into generalized fields that can be described using collection syntax in the YAML file. You may want to consult with the content owners about the intention of different content types. You can use existing templates as a guideline and look for how the existing template chooses to classify and abstract out those details. 

[Lauren and Tyler had a working session migrating existing content to an existing content type](https://youtu.be/nY44VzBCs7s).

Once you've defined the collection in the Netlify CMS configuration, you'll need to set up [Middleman dynamic pages](https://middlemanapp.com/advanced/dynamic-pages/) to reference the data Netlify CMS will create for you, and wire it up with the appropriate template.
