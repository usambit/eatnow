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
    price: meal.price
    restaurant.id: meal.restaurantId
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

update =(cname,cb) ->
  model.update
    cname:meal.cname
    price:meal.price
    where:
      cname: meal.cname
      price: meal.price
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(meal) ->
  model.destory
    where:
      id: meal.id
      cname: meal.cname
      price: meal.price
      restaurantId: meal.restaurantId
  .then (data) ->
    cb null, data
  , (err) ->
    cb err


module.exports = { init, create, find, findAll , update , destory}
