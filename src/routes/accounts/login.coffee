'use strict';

###
get: no support
post: user login
###

express = require 'express'
router  = express.Router()

router.route '/'
  .post (req, res) ->
    if req.body.type is 'admin'
      if req.body.sid is 'admin@a.com' and req.body.password is 'admin'
        res.redirect '/admin'
      else
        res.redirect '/admin/login'
    # else


module.exports = router;
