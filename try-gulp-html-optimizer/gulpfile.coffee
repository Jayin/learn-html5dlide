gulp = require 'gulp'
htmlOptimizer = require 'gulp-html-optimizer'
imgCssSprite = require 'gulp-img-css-sprite'

destBase = './dest/'

gulp.task 'copy', ()->
    gulp.src ['./src/img/**/*',]
        .pipe gulp.dest(destBase)

gulp.task 'sprite', ->
    gulp.src('src/**/*.+(jpg|png|jpeg)')
        # .pipe imgCssSprite.imgStream
        #     padding: 2
        .pipe gulp.dest('dest')

gulp.task 'example', ['sprite'], ()->
    console.log 'test'
    gulp.src ['./src/*.src.html']
        .pipe htmlOptimizer
            generateDataUri: true 
            beautifyTemplate: true
            trace: true
            cssSprite:
                base: 
                    url: '//webyom.org'
                    dir: './src'
        .pipe gulp.dest(destBase)


gulp.task 'watch', ['example'], ()->
    gulp.watch ['./src/**/*'], ['example']


gulp.task 'default', ['watch']