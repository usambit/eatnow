Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'orders',
  id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
  sid:
      type: sequelize.STRING
      allownull:no
  cname:
      type: Sequelize.STRING
      allowNull: no
  phone:
      type: Sequelize.STRING
      allowNull: no
  restName:
      type: Sequelize.STRING
      allowNull: no
  mealName:
      type: Sequelize.STRING
      allowNull: no
  totalprice:
      type: Sequelize.INTEGER
      allownull: no
  , indexes: [
      fields: ['cname']
    ]

create = (order, cb) ->
  model.create
    account.sid: order.sid
    account.cname: order.cname
    account.phone: order.phone
    restaurant.cname: order.restName
    meal.cname: order.mealName
    totalprice: totalprice
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (id, cb) ->
  model.find
    where:
      id: id
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

findAll = (cb) ->
  model.find
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

update =(order,cb) ->
  model.update
    sid: order.sid
    cname: order.cname
    price: order.price
    restName: order.restName
    mealName: order.mealName
    totalprice: order.totalprice
    where:
    sid: order.sid
    cname: order.cname
    price: order.price
    restName: order.restName
    mealName: order.mealName
    totalprice: order.totalprice
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err


module.exports = { init, create, find, findAll , update}
