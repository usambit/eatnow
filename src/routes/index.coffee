express = require 'express'
path    = require 'path'
router  = express.Router()

# router.use '/', express.static path.join __dirname, '../../public/eatnow'
# router.use '/admin', express.static path.join __dirname, '../../public/admin'
router.use '/', express.static path.join __dirname, '../../public/root'
router.use '/', require './eatnow'
router.use '/admin', require './admin'
router.use '/accounts', require './accounts'
router.use '/actions', require './actions'
router.use '/resources', require './resources'

module.exports = router
