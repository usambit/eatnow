'use strict';

###
get: no support
post: admin assign work to staff
###

express = require 'express'
router  = express.Router()
orderModel = require '../../models/sequelize/orderModel'

tolm = 10
tolb = 2

router.route '/'
  .post (req, res) ->
    i = 0
    rtn = []
    timemap = ['12:30', '12:45', '13:00']
    loopCb = (idx, d) ->
      i++
      rtn[i] =
        time: timemap[idx]
        dmans: 1
      if i == 3
        res.status(200).json code: 200, message: 'success'



    orderModel.findByTime '12:30', (err, data) ->
      dmans: []

      dMi = 0
      dMstartI = 0
      dMendI = 0
      dMq = 0
      prev = null
      curr = null

      ords = []
      ord = []
      ordQ = 0
      dlen = data.length
      for d, i in data
        prev = data[i-1] or null
        curr = d
        if !prev or (curr.buildName  == prev.buildName and curr.roomName == prev.roomName)
          ord.push curr
          ordQ = ordQ + curr.quantity
        else
          ords.push
            name: prev.buildName + ", " + prev.roomName
            menu: ord,
            price: prev.totalprice
            account: prev.cname
            q: ordQ
          ord = []
          ordQ = 0

        if i == (dlen-1)
          ords.push
            name: curr.buildName + ", " + curr.roomName
            menu: ord,
            price: curr.totalprice
            account: curr.cname
            q: ordQ + curr.quantity
          ord = []
          ordQ = 0

      console.log ords

      dmans = []
      rooms = []
      for oo, j in ords
        console.log dMq, tolm, oo.q
        if ((dMq + oo.q) < tolm)
          rooms.push oo
          dMq = dMq + oo.q
          #console.log  oo
        else
          console.log('...', j)
          dmans.push
            rooms: rooms
            name: j
          rooms = []
          rooms.push oo
          dMq = oo.q

        rlen = ords.length
        if j == (rlen-1)
          console.log('@@', j)
          dmans.push
            rooms: rooms
            name: j+1
          rooms = []
          dMq = 0
      console.log dmans

      dd =
        time: '12:30'
        dmans: dmans
      res.status(200).json code: 200, message: 'success', data: dd





    # orderModel.findByTime '12:45', (err, data) ->

    # orderModel.findByTime '13:00', (err, data) ->

    #res.status(200).json code: 200, message: 'success'

module.exports = router;
