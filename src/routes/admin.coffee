'use strict';

###
ui
###

express = require 'express'
router  = express.Router()

# restaurants and assign button
router.get '/', (req, res) ->
  res.render 'adminRoot'

# id/ password/ login
router.get '/login', (req, res) ->
  res.render 'adminLogin'

# list and menu
router.get '/restaurants', (req, res) ->
  res.render 'adminRest',
    data: [
      id: '1'
      cname: 'R1'
      menu: [
        name: 'F1'
        price: 20
      ,
        name: 'F2'
        price: 26
      ]
    ,
      id: '2'
      cname: 'R2'
      menu: [
        name: 'F3'
        price: 23
      ,
        name: 'F4'
        price: 25
      ]
    ]

# assign button
# router.get '/assign', (req, res) ->
  # res.render 'adminAssign'

# report
router.get '/assign/report', (req, res) ->
  res.render 'adminReport',
    data: [
      time: '12:30'
      dmans: [
        name: 'D1'
        rooms: [
          name: 'R1'
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

module.exports = router;
