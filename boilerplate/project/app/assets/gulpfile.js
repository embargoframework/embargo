// Load plugins
var gulp = require('gulp'),
	coffee = require('gulp-coffee'),
	gzip = require('gulp-gzip'),
	sass = require('gulp-ruby-sass'),
	autoprefixer = require('gulp-autoprefixer'),
	minifycss = require('gulp-minify-css'),
	haml = require('gulp-ruby-haml'),
	uglify = require('gulp-uglify'),
	uglify = require('gulp-uglify'),
	imagemin = require('gulp-imagemin'),
	rename = require('gulp-rename'),
	concat = require('gulp-concat'),
	notify = require('gulp-notify'),
	cache = require('gulp-cache'),
	browserSync = require('browser-sync'),
	del = require('del'),
	svgSprite = require("gulp-svg-sprites"),
	livereload = require('gulp-livereload'),
	gutil = require('gulp-util');

// Paths
var paths = {
	haml: ['./../views/*.haml'],
	scss: ['./src/scss/styles.scss', './src/scss/secondary.scss'],
	coffee: ['./src/coffee/**/*.coffee'],
	js: ['./src/js/**/*.js'],
	img: ['./src/img/**/*.{png,svg,jpg,jpeg,gif}'],
	extras: ['./src/*.*','./src/.htaccess'],
	fonts: ['./src/scss/fonts.css'],
	libs: ['./src/js/vendor/**/*.js'],
	dist: {
		css: './../public/css/',
		coffee: './src/js/',
		js: './../public/js/',
		img: './../public/img/',
		extras: './../public/',
		fonts: './../public/css/',
		libs: './../public/js/'
	}
};

// Styles
gulp.task('styles', function() {
	return gulp.src(paths.scss)
		.pipe(sass({ style: 'expanded', }))
		.pipe(autoprefixer('last 2 version', 'safari 5', 'ie 8', 'ie 9', 'opera 12.1', 'ios 6', 'android 4'))
		.pipe(gulp.dest(paths.dist.css))
		.pipe(rename({ suffix: '.min' }))
		.pipe(minifycss())
		.pipe(gulp.dest(paths.dist.css))
		.pipe(gzip())
		.pipe(gulp.dest(paths.dist.css))
		.pipe(notify({ message: 'Styles task complete' }))
		.pipe(livereload());
});

// Scripts
gulp.task('coffee', function() {
	var c = coffee({bare: true});
	c.on('error', function(e){
		gutil.log(e);
		c.end();
	});
	return gulp.src(paths.coffee)
		.pipe(c)
		.pipe(gulp.dest(paths.dist.coffee));
});

gulp.task('scripts', ['coffee'], function() {
	return gulp.src(paths.js)
		.pipe(concat('scripts.js'))
		.pipe(gulp.dest(paths.dist.js))
		.pipe(rename({ suffix: '.min' }))
		.pipe(uglify())
		.pipe(gulp.dest(paths.dist.js))
		.pipe(gzip())
		.pipe(gulp.dest(paths.dist.js))
		.pipe(notify({ message: 'Scripts task complete' }))
		.pipe(livereload());
});

// Images
gulp.task('images', function() {
	return gulp.src(paths.img)
		.pipe(cache(imagemin({ optimizationLevel: 5, interlaced: true })))
		.pipe(gulp.dest(paths.dist.img))
		.pipe(gzip())
		.pipe(gulp.dest(paths.dist.img))
		.pipe(notify({ message: 'Images task complete' }))
		.pipe(livereload());
});

// SVG Sprites
gulp.task('sprites', function () {
  return gulp.src('./src/img/*.svg')
    .pipe(svgSprite())
    .pipe(gulp.dest(paths.dist.img))
		.pipe(livereload());
});

// Extras
gulp.task('extras', function() {
	return gulp.src(paths.extras)
		.pipe(gulp.dest(paths.dist.extras))
		.pipe(livereload());
});

// Fonts
gulp.task('fonts', function() {
	return gulp.src(paths.fonts)
		.pipe(gulp.dest(paths.dist.fonts))
		.pipe(livereload());
});

gulp.task('haml', function() {
	return gulp.src(paths.haml)
		.pipe(livereload());
});

// Delete the dist directory and start fresh
gulp.task('clean', function(cb) {
	cache.clearAll(del(['./../public'], {force: true}, cb));
});

// Default task
gulp.task('default', ['clean'], function() {
    gulp.start('styles', 'scripts', 'images', 'extras', 'fonts', 'watch');
});

// Watch
gulp.task('watch', function() {
	livereload.listen();
	// Watch .scss files
	gulp.watch('./src/scss/**/*.scss', ['styles']);
	// Watch .coffee files
	gulp.watch(paths.coffee, ['scripts']);
	// Watch .js files
	gulp.watch(paths.js, ['scripts']);
	// Watch image files
	gulp.watch(paths.img, ['images']);
	// Watch extra files
	gulp.watch(paths.extras, ['extras']);
	gulp.watch(paths.fonts, ['fonts']);

	gulp.watch(paths.haml, ['haml']);

	// Watch any files in dist/, reload on change
	//gulp.watch(['./dist']).on('change', browserSync.reload);
});