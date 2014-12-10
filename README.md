<<<<<<< HEAD
Getting Started
========

1. Install [node](http://nodejs.org/)
1. Install gulp dependencies `(cd frontend && npm install)`
1. Install [rvm](http://rvm.io/)
1. Return to root directory `cd ..`
1. Install ruby 2.1.2 `rvm install 2.1.2`
1. Install bundler `gem install bundler`
1. Run `bundle` in this directory
1. Start the server with `foreman start`

Development Details
========
When you run `foreman start` the server is started and a [gulp task](http://github.com/traitify/homepage/frontend/gulpfile.js) is also started. This allows you to edit the files in the [frontend](http://github.com/traitify/homepage/frontend) directory and see your changes in the website. 

The gulp task will compile your sass, image, etc. changes and move them to the public folder. The public folder is auto-generated and should not be modified. Any code you place manually in the public folder will be overwritten.

The app has live-reload enabled so when you make a change to one of the files it is watching, the browser will refresh for you automatically.

If you would like to run the app in production mode, you can do so by running:

```
foreman start -f Procfile.prod
```

View in your browser on port 5000.
=======
boilerplaterb
=============
>>>>>>> c9b89222711fc36db0417a0c70b50f5fa5b2f4fe
