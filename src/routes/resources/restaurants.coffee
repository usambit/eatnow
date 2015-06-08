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
    response = new Response 'SUCCESS'
    res.body = response.getBody()
    next()
    # cb = (err) ->
    #   if err
    #     next('FAILURE')
    #   else
    #     next()

    # switch req.body.method
    #   when 'update' then restaurantService.update req.body, cb
    #   when 'create' then restaurantService.create req.body, cb
    #   when 'delete' then restaurantService.delete req.body, cb
  , routerHelper.handleSuccess
  , routerHelper.handleError


router.route '/:rid'
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
    restaurantService.getRestaurant req.params.rid, cb
  , routerHelper.handleSuccess
  , routerHelper.handleError

  # validator.checkReqParams ['method']
  .post (req, res, next) ->
    cb = (err) ->
      if err
        next('FAILURE')
      else
        response = new Response 'SUCCESS'
        res.body = response.getBody()
        next()

    if !req.body.method then cb 'err'
    switch req.body.method
      # when 'update' then restaurantService.saveRestaurant req.body, cb
      when 'create' then restaurantService.addRestaurant req.body, cb
      # when 'delete' then restaurantService.delete req.body, cb
      else cb 'not match'

  , routerHelper.handleSuccess
  , routerHelper.handleError


module.exports = router;
