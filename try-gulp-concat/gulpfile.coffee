gulp = require 'gulp'
concat = require 'gulp-concat'
coffee = require 'gulp-coffee'

gulp.task 'default',() ->
    gulp.src "./src/**/*.coffee" 
        .pipe concat('main.coffee')
        .pipe coffee()
        .pipe gulp.dest('./dest/')
