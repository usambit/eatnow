'use strict';

###
ui
###

express = require 'express'
router  = express.Router()
restService = require '../services/restaurantService'
orderModel = require '../models/sequelize/orderModel'
ar = require './accounts/login'


tolm = 10
tolb = 2
tt  = (req, res, next)->
  req.type = 'admin'
  next()
console.log tt, ar.check
# restaurants and assign button
router.get '/', tt, ar.check,  (req, res) ->
  res.render 'adminRoot'

# id/ password/ login
router.get '/login',tt,  (req, res) ->
  res.render 'adminLogin'

# list and menu
router.get '/restaurants',tt, ar.check,  (req, res) ->
  cb = (err, data) ->
    if err
      next err
    else
      return res.render 'adminRest',
        data: data

  restService.getList cb

    #   [
    #   id: '1'
    #   cname: 'R1'
    #   place: '...'
    #   img: '..//'
    #   menu: [
    #     id: 1
    #     cname: 'F1'
    #     price: 20
    #   ,
    #     name: 'F2'
    #     price: 26
    #   ]
    # ,
    #   id: '2'
    #   cname: 'R2'
    #   menu: [
    #     name: 'F3'
    #     price: 23
    #   ,
    #     name: 'F4'
    #     price: 25
    #   ]
    #]

# assign button
# router.get '/assign', (req, res) ->
  # res.render 'adminAssign'


queryDb = (time, cb) ->
  orderModel.findByTime time, (err, data) ->
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

    cb
      time: time
      dmans: dmans

# report
router.get '/assign/report', tt, ar.check, (req, res) ->
  i = 0
  rtn = []
  rtn[0] = null
  rtn[1] = null
  #rtn[2] = null
  timemap = ['12:30', '12:45', '13:00']
  loopCb = (idx, data) ->
    i++
    rtn[idx] = data
    if i==2
      res.render 'adminReport',
        data: rtn

  queryDb '12:30', (data) ->
    loopCb(0, data)

  queryDb '12:45', (data)->
    loopCb(1, data)




###
  res.render 'adminReport',
    data: [
      time: '12:30'
      dmans: [
        name: 'D1'
        rooms: [
          name: 'R1'
          menu: [
            id: 1
            cname: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ,
          name: 'R2'
          menu: [
            name: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ]
      ,
        name: 'D2'
        rooms: [
          name: 'R2'
          menu: [
            name: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ,
          name: 'R4'
          menu: [
            name: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ]
      ]
    ,
      time: '12:45'
      dmans: [
        name: 'D1'
        rooms: [
          menu: [
            name: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ,
          menu: [
            name: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ]
      ,
        name: 'D2'
        rooms: [
          menu: [
            name: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ,
          menu: [
            name: 'F1'
            q: 3
          ,
            name: 'F2'
            q: 2
          ]
          price: 200
          account: 'S1'
        ]
      ]
    ]
###
module.exports = router;
