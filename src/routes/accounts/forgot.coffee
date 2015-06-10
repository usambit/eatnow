'use strict';

###
get: no support
post: user forgot password
###

express = require 'express'
router  = express.Router()

router.route '/'
  .post (req, res) ->
    res.status(200).json code: 200, message: 'success'

module.exports = router;
