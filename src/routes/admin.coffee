'use strict';

###
ui
###

express = require 'express'
router  = express.Router()

# restaurants and assign button
router.get '/', (req, res) ->
  res.render 'adminRoot'

# id/ password/ login
router.get '/login', (req, res) ->
  res.render 'adminLogin'

# list and menu
router.get '/restaurants', (req, res) ->
  res.render 'adminRest'

# assign button
router.get '/assign', (req, res) ->
  res.render 'adminAssign'

# report
router.get '/assign/report', (req, res) ->
  res.render 'adminReport'

module.exports = router;
