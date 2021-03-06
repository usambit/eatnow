express      = require 'express'
path         = require 'path'
favicon      = require 'serve-favicon'
cookieParser = require 'cookie-parser'
bodyParser   = require 'body-parser'
session = require('express-session')

routes = require './routes/index'

app = express()

# view engine setup
app.set 'views', path.join __dirname, '../views'
app.set 'view engine', 'jade'

# uncomment after placing your favicon in /public
#app.use favicon __dirname + '/public/favicon.ico'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true
app.use(session({ secret: 'keyboard cat', cookie: { maxAge: 60000 }}))
app.use cookieParser()
app.use routes


# catch 404 and forward to error handler
app.use (req, res, next) ->
  err = new Error 'Not Found'
  err.status = 404
  next err

# error handlers

# development error handler
# will print stacktrace
if (app.get 'env') == 'development'
  app.use (err, req, res, next) ->
    res.status err.status or 500
    res.render 'error',
      message: err.message
      error: err

# production error handler
# no stacktraces leaked to user
app.use (err, req, res, next) ->
  res.status err.status or 500
  res.render 'error',
    message: err.message
    error: {}


module.exports = app
