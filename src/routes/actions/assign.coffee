'use strict';

###
get: no support
post: admin assign work to staff
###

express = require 'express'
router  = express.Router()

router.route '/'
  .post (req, res) ->
    res.status(200).json code: 200, message: 'success'

module.exports = router;
