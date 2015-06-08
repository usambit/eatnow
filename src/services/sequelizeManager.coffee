Sequelize = require 'sequelize'
conf      = require '../../conf/sequelize.json'
models    = require '../models/sequelize'

init = (cb) ->
  sequelize = new Sequelize conf.dbname,
    conf.username
    conf.password
    conf.params

  # for mname, model of models
  #   model.init sequelize

  restaurant = models.restaurant.init sequelize
  meal = models.meal.init sequelize

  restaurant.hasMany meal #, onDelete: 'cascade', hooks:true
  meal.belongsTo restaurant, as: 'Menu', foreignKey: 'restaurant_id'

  sequelize.sync({force: true})
  .then ->
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

    cb()
  , (err) ->
    cb err

module.exports =
  init: init
