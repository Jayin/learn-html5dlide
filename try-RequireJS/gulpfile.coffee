gulp = require 'gulp'
coffee = require 'gulp-coffee'
concat = require 'gulp-concat'

gulp.task 'require-config', ()->
    gulp.src(['./src/libs/require/require.js', "./src/config/require-config.js",])
        .pipe concat('require-lite.js')
        .pipe gulp.dest('./src/libs/require/')


watcher = gulp.watch './src/config/require-config.js', ['require-config']
watcher.on 'change', (event)->
    console.log 'File ' + event.path + 'was ' + event.type + '  ,running tasks...'

gulp.task 'default',['require-config']