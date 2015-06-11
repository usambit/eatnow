'use strict';

###
ui
###

express = require 'express'
router  = express.Router()
restService = require '../services/restaurantService'
ar = require './accounts/login'

tt  = (req, res, next)->
  req.type = 'de'
  next()

# homepage order/ login/ logout
router.get '/',  ar.check,(req, res) ->
  #req.session.isLogin = true
  #console.log req.session.isLogin

  cb = (err, data) ->
    if err
      next err
    else
      res.render 'eatnowRest',
        data: data

  restService.getList cb

# login
router.get '/login', (req, res) ->
  res.render 'eatnowLogin'


# show restaurant menu
# router.get '/restaurants/:rid', (req, res) ->
#     res.render 'eatnowMenu'

# show order car, object menu, and submit
router.get '/car', ar.check,(req, res) ->
    res.render 'eatnowCar'


module.exports = router;
