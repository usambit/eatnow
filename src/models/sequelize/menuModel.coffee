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
  , indexes: [
      fields: ['cname']
    ]


create = (meal, cb) ->
  model.create
    cname: meal.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (meal, cb) ->
  model.create
    price: meal.price
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (meal,cb) ->
  model.create
    restaurantId: meal.restaurantId
  .then (data) ->
    cb null,data
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

find = (price, cb) ->
  model.find
    where:
      price: price
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (restaurantId, cb) ->
  model.find
    where:
      restaurantId: restaurantId
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

update =(cname,cb) ->
  model.update
    cname:meal.cname
    where:
      cname: meal.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(price,cb) ->
  model.update
    price:meal.price
    where:
      price: meal.price
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(cname) ->
  model.destory
    where:
      cname: meal.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

destory =(price) ->
  model.destory
  where:
    price: meal.price
  .then (data) ->
    cb null, data
  , (err) ->
    cb err


module.exports = { init, create, find, findAll , update , destory}
