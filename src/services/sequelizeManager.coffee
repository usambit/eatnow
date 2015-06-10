Sequelize = require 'sequelize'
conf      = require '../../conf/sequelize.json'
models    = require '../models/sequelize'

init = (cb) ->
  sequelize = new Sequelize conf.dbname,
    conf.username
    conf.password
    conf.params

  for mname, model of models
    model.init sequelize

  restaurant = models.restaurant.init sequelize
  console.log '!!!', restaurant.create
  menu = models.menu.init sequelize
  build = models.build.init sequelize
  dman = models.dman.init sequelize
  order = models.order.init sequelize
  room = models.room.init sequelize
  account = models.account.init sequelize


  # restaurant.hasMany meal #, onDelete: 'cascade', hooks:true
  # meal.belongsTo restaurant, as: 'Menu', foreignKey: 'restaurant_id'
  # account.create sid: 's1', pw: '11', cname: 'c1', phone: '09xx', email: 'a@a.aa'
  # build.create cname: 'b1', start: 'xx', end: 'yy', time: 5
  # dman.create cname: 'c1', phone: '09xx'
  # restaurant.create: cname: 'r1', place: 'p1', img: '../p.png'
  # order.create sid: 's1', cname: 'sn', phone: '09xx', restName: 'aa', mealName: 'mm', totalprice: 200
  # room.create cname: 'r1', start: 'xx', end: 'aa', time: 5, buildName: 'b1'
  # menu.create cname: 'm1', price: 20

  sequelize.sync( force: true )
  .then ->
    o =
      restaurant: restaurant
      menu: menu
      build: build
      dman: dman
      order: order
      room: room
      account: account

    db = require '../db'
    db o

    # setTimeout ->
    #   restaurant.create
    #     cname: 'R1'
    #   .then (r) ->
    #     m1 = meal.build
    #       cname: 'Rm1'
    #       price: 20
    #     m2 = meal.build
    #       cname: 'Rm2'
    #       price: 25

    #     r.addMeals [m1, m2]
    #     .then (d) ->
    #       m1.save()
    #       m2.save()
    # , 500
    # models.restaurant.find '1', (err, data)->
    #   console.log
    #     id: data.id
    #     cname: data.cname
    #     place: data.place
    #     img: data.img

    cb()
  , (err) ->
    cb err

module.exports =
  init: init
