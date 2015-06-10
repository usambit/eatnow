'use strict';

###
get: get all staff info
post: create/ update/ delete staff info
###

express = require 'express'
router  = express.Router()

router.route '/'
  .get (req, res) ->
    res.status(200).json code: 200, message: 'success'

  .post (req, res) ->
    res.status(200).json code: 200, message: 'success'

module.exports = router;
