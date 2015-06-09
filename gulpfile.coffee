gulp       = require 'gulp'
coffee     = require 'gulp-coffee'
coffeelint = require 'gulp-coffeelint'
mocha      = require 'gulp-mocha'
istanbul   = require 'gulp-coffee-istanbul'
sourcemaps = require 'gulp-sourcemaps'
supervisor = require 'gulp-supervisor'

paths =
  specs  : ['test/**/*.coffee']
  scripts: ['src/**/*.coffee']
  jsDest : './app/'
  startup: 'bin/startup'

gulp.task 'watch', ['compile'], ->
  gulp.watch paths.scripts, ['compile']

gulp.task 'compile', ->
  gulp.src paths.scripts
    .pipe sourcemaps.init()
    .pipe (coffee bare: true).on 'error', (err) ->
      console.log err
      @emit 'end'
    .pipe sourcemaps.write includeContent: false, sourceRoot: '/src'
    .pipe gulp.dest paths.jsDest

# if compile error? win will error?
gulp.task 'supervisor', ->
  supervisor paths.startup

gulp.task 'dev', ['watch', 'supervisor'], ->
