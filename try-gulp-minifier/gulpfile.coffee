gulp = require 'gulp'
minify = require 'gulp-minifier'
concat = require 'gulp-concat'

gulp.task 'example', ->
   gulp.src './src/**/*.[html|css]'
       .pipe minify
                minify: true,
                collapseWhitespace: true,
                conservativeCollapse: true,
                minifyJS: true,
                minifyCSS: true
       .pipe gulp.dest('./dest')


    gulp.src './src/**/*.js'
        .pipe concat('main.js')
        .pipe minify
                minify: true,
                collapseWhitespace: true,
                conservativeCollapse: true,
                minifyJS: true,
                minifyCSS: true
        .pipe gulp.dest('./dest/')


gulp.task 'default', ['example']