'use strict';

###
get: no support
post: user get orders
###

express = require 'express'
router  = express.Router()

router.route '/'
  .get (req, res) ->
    res.status(200).json code: 200, message: 'orders success'

module.exports = router;
