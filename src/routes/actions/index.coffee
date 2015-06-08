'use strict';

###
get: no support
post: no support
###

express = require 'express'
router  = express.Router()

router.use '/order', require './order'
router.use '/assign', require './assign'

module.exports = router;
