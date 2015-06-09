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
    sid: order.sid
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (order, cb) ->
  model.create
    cname: order.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (order, cb) ->
  model.create
    phone: order.phone
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (order, cb) ->
  model.create
    restName: order.restName
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (order, cb) ->
  model.create
    mealName: order.mealName
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (order, cb) ->
  model.create
    totalprice: order.totalprice
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (sid, cb) ->
  model.find
    where:
      sid: sid
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (cname, cb) ->
  model.find
    where:
      cname: cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (phone, cb) ->
  model.find
    where:
      phone: phone
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (restName, cb) ->
  model.find
    where:
      restName: restName
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (mealName, cb) ->
  model.find
    where:
      mealName: mealName
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

update =(sid,cb) ->
  model.update
    sid: meal.sid
    where:
      sid: order.sid
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(cname,cb) ->
  model.update
    cname: meal.cname
    where:
      cname: order.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(phone,cb) ->
  model.update
    price: meal.price
    where:
      price: order.price
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(restName,cb) ->
  model.update
    cname: meal.restName
    where:
      restname: order.restName
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(mealName,cb) ->
  model.update
    mealName: meal.mealName
    where:
      mealName: order.mealName
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

module.exports = { init, create, find, findAll , update}
