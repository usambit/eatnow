'use strict';

###
ui
###

express = require 'express'
router  = express.Router()

# homepage order/ login/ logout
router.get '/', (req, res) ->
  res.render 'eatnowRoot'

# list restaurant name and pic
router.get '/restaurants', (req, res) ->
    res.render 'eatnowRest'

# show restaurant menu
router.get '/restaurants/:rid', (req, res) ->
    res.render 'eatnowMenu'

# show order car, object menu, and submit
router.get '/car', (req, res) ->
    res.render 'eatnowCar'


module.exports = router;
