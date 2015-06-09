'use strict';

###
get: get all restaurants info
post: create/ update/ delete restaurants info

/rid
get: get the restaurant info
post: create/ update/ delete the restaurant info
###

express = require 'express'
router  = express.Router()
routerHelper = require '../../middleware/routerHelper'
validator = require '../../middleware/validator'
restaurantService = require '../../services/restaurantService'
Response = require '../../models/responseModel'

router.route '/'
  .get (req, res, next) ->
    cb = (err, data) ->
      if err
        next('FAILURE')
      else
        response = new Response 'SUCCESS'
        response.setData 'data',
          restaurants: data

        res.body = response.getBody()
        next()
    restaurantService.getList cb
  , routerHelper.handleSuccess
  , routerHelper.handleError

  #validator.checkReqParams ['method']
  .post (req, res, next) ->

    cb = (err) ->
      if err
        next('FAILURE')
      else
        res.redirect req.originalUrl
        # next()

    if !req.body.method then cb 'err'
    switch req.body.method
      when 'update' then restaurantService.saveRest req.body, cb
      when 'create' then restaurantService.addRest req.body, cb
      when 'delete' then restaurantService.delRest req.body, cb
      else cb 'not match'

  , routerHelper.handleSuccess
  , routerHelper.handleError


router.route '/:rid'
  # .get (req, res, next) ->
  #   cb = (err, data) ->
  #     if err
  #       next('FAILURE')
  #     else
  #       next()
  #   restaurantService.getRestaurant req.params.rid, cb
  # , routerHelper.handleSuccess
  # , routerHelper.handleError

  # validator.checkReqParams ['method']
  .post (req, res, next) ->
    cb = (err) ->
      if err
        next('FAILURE')
      else
        res.redirect req.originalUrl
        # next()

    if !req.body.method then cb 'err'
    switch req.body.method
      when 'update' then restaurantService.saveMenu req.body, cb
      when 'create' then restaurantService.addMenu req.body, cb
      when 'delete' then restaurantService.delMenu req.body, cb
      else cb 'not match'

  , routerHelper.handleSuccess
  , routerHelper.handleError


module.exports = router;
