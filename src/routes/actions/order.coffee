'use strict';

###
get: no support
post: user create one order
###

express = require 'express'
router  = express.Router()
orderModel = require '../../models/sequelize/orderModel'


router.route '/'
  .post (req, res) ->
    for order in req.body.orders
      orderModel.create order, ->

    res.status(200).json code: 200, message: 'success'

module.exports = router;
