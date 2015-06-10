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
      type: Sequelize.STRING
      allowNull: no
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
    buildName:
      type: Sequelize.STRING
      allowNull: no
    roomName:
      type: Sequelize.STRING
      allowNull: no
    quantity:
      type: Sequelize.INTEGER
      allowNull: no
    time:
      type: Sequelize.STRING
      allowNull: no
    totalprice:
      type: Sequelize.INTEGER
      allowNull: no
  ,
    indexes: [
      fields: ['cname']
    ]

create = (order, cb) ->
  model.create
    sid: order.sid
    cname: order.cname
    phone: order.phone
    restName: order.restName
    mealName: order.mealName
    totalprice: order.totalprice,
    buildName: order.buildName,
    roomName: order.roomName,
    quantity: order.quantity,
    time: order.time
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (id, cb) ->
  model.findById id
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

findByTime = (time, cb) ->
  model.findAll
    where:
      time: time
    order: [['buildName', 'ASC']]
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

findAll = (cb) ->
  model.findAll()
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

update = (order, id, cb) ->
  model.update
    sid: order.sid
    cname: order.cname
    price: order.price
    restName: order.restName
    mealName: order.mealName
    totalprice: order.totalprice
    buildName: order.buildName,
    roomName: order.roomName,
    quantity: order.quantity,
    time: order.time
  ,
    where:
      id: id
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err


module.exports = { init, create, find, findByTime, findAll, update }
