# JEKYLL-BLOG-DTS

While I continue working on [*yabe*](https://github.com/davidtsadler/yabe) I hope to be using [*jekyll*](https://github.com/mojombo/jekyll) to get my blog over at [*davidtsadler.com*](http://davidtsadler.com) up and running.

## Features

* Code to be generic enough so that it can be used by anyone as the basis for a very simple blog site.
* [HTML5 boilerplate](http://html5boilerplate.com/) integration.
* Rake tasks for developing and maintaining the site.

## Usage

* Clone this repository with `git clone git://github.com/davidtsadler/jekyll-blog-dts.git my_site`
* Change into the site's directory `cd my_site`
* Use the provided *_config.yml.example* file as the basis for the site's configuration. `cp _config.yml.example _config.yml`
* Edit *_config.yml* and specify any configuration settings you require.
* Create some dummy posts for testing with the provided rake task. `rake jekyll:dummy_posts`
* Launch the server with development settings using `rake jekyll:dev_server` and browse http://localhost:4000/ to see your site.
