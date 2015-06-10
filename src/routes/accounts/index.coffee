'use strict';

###
get: get all accounts info
post: create/ update/ delete accounts info

/sid
get: get the account info
post: create/ update/ delete the account info
###

express = require 'express'
router  = express.Router()

router.use '/login', require './login'
router.use '/logout', require './logout'
#router.use '/password/reset', require './reset'
router.use '/:sid/orders', require './orders'

router.route '/'
  .get (req, res) ->
    res.status(200).json code: 200, message: 'success'

  .post (req, res) ->
    res.status(200).json code: 200, message: 'success'

router.route '/:sid'
  .get (req, res) ->
    res.status(200).json code: 200, message: 'sid success'

  .post (req, res) ->
    res.status(200).json code: 200, message: 'success'

module.exports = router;
