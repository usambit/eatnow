Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'meals',
    id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
    cname:
      type: Sequelize.STRING
      allowNull: no
    price:
      type: Sequelize.INTEGER
      allowNull: no
    restaurantId:
      type: Sequelize.UUID
      allowNull: no
  ,
    indexes: [
      fields: ['cname']
    ]


create = (meal, cb) ->
  model.create
    cname: meal.cname
    price: meal.price
    restaurantId: meal.restaurantId
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

findByRid = (rid, cb) ->
  model.findAll
    where:
      restaurantId: rid
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

update = (id, meal, cb) ->
  model.update
    cname: meal.cname
    price: meal.price
  ,
    where:
      id: id
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

destory = (id) ->
  model.destory
    where:
      id: id
  .then (data) ->
    cb null, data
  , (err) ->
    cb err


module.exports = { init, create, find, findByRid, findAll , update , destory}
