gulp = require 'gulp'

destBase = './dest/'

gulp.task 'copy', ()->
    gulp.src ['css/**/*']
        .pipe gulp.dest(destBase + 'css/')


gulp.task 'example', ()->
    htmlOptimizer = require 'gulp-html-optimizer'
    gulp.src('./*.src.html')
        .pipe htmlOptimizer
            base64img: true
            beautifyTemplate: true
            trace: true
        .pipe gulp.dest(destBase)


gulp.watch ['./*.html', './include/*.html'],['example']


gulp.task 'default',['example']