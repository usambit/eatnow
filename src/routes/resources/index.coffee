'use strict';

###
get: no support
post: no support
###

express = require 'express'
router  = express.Router()

router.use '/restaurants', require './restaurants'
router.use '/dman', require './dman'

module.exports = router;
