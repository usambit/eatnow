'use strict';

###
get: no support
post: user login
###

express = require 'express'
router  = express.Router()
aM      = require '../../models/sequelize/accountModel'

router.check = (req, res, next) ->
  console.log req.type, req.session.isAdmin
  if req.type is 'admin'
    if !req.session.isAdmin
      res.redirect '/admin/login'
    next()
  else
    if !req.session.isMeb
      res.redirect '/login'
    next()


router.route '/'
  .post (req, res) ->
    if req.body.type is 'admin'
      if req.body.sid is 'admin' and req.body.password is 'admin'
        req.session.isAdmin = true
        res.redirect '/admin'
      else
        req.session.isAdmin = false
        res.redirect '/admin/login'
    else
      aM.findBySid req.body.sid, (err, data) ->
        console.log data[0].dataValues.pw
        if data[0].dataValues.pw == req.body.pw
          req.session.isMeb = true
          res.redirect '/'
        else
          req.session.isMeb = false
          res.redirect '/login'




module.exports = router;
