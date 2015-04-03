gulp = require 'gulp'
trace = require 'gulp-trace'
concat = require 'gulp-concat'

gulp.task 'example', ->
    # js
    gulp.src('./src/**/*.js')
        .pipe trace()
        .pipe concat('main.js')
        .pipe gulp.dest('./dest/')

    # css
    gulp.src('./src/**/*.css')
        .pipe trace()
        .pipe concat('main.css')
        .pipe gulp.dest('./dest/')

gulp.task 'default', ['example']