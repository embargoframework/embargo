Getting Started

1. Install [node](http://nodejs.org/)
2. Install [rvm](http://rvm.io/)
3. Install ruby 2.1.2 `rvm install 2.1.2`
4. Install bundler `gem install bundler`
5. Install Embargo `gem install embargo`
6. Create your application `embargo new your-application`
7. Move into your project directory `cd your-application`
8. Start your server `embargo server`




Development Details
========
When you run `embargo server` the server is started and a [gulp task](http://github.com/traitify/homepage/frontend/gulpfile.js) is also started. This allows you to edit the files in the [assets](http://github.com/traitify/embargo/assets) directory and see your changes in the website. 

The gulp task will compile your sass, image, etc. changes and move them to the public folder. The public folder is auto-generated and should not be modified. Any code you place manually in the public folder will be overwritten.

The app has live-reload enabled so when you make a change to one of the files it is watching, the browser will refresh for you automatically.

If you would like to run the app in production mode, you can do so by running:

```
foreman start -f Procfile.prod
```

View in your browser on port 5000.
