'use strict';

###
ui
###

express = require 'express'
router  = express.Router()
restService = require '../services/restaurantService'


# homepage order/ login/ logout
router.get '/', (req, res) ->
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
router.get '/car', (req, res) ->
    res.render 'eatnowCar'


module.exports = router;
