Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'restaurants',
  id:
    primaryKey: yes
    type: Sequelize.UUID
    defaultValue: Sequelize.UUIDV1
    allowNull: no
  cname:
    type: Sequelize.STRING
    allowNull: no
  place:
    type: Sequelize.STRING
    allownull: no
  img:
    type: Sequelize.STRING
    allownull: no
  ,
    index: [
      fields: ['cname']
    ]

create = (restaurant, cb) ->
  model.create
    cname: restaurant.cname
    place: restaurant.place
    img: restaurant.img
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

findAll = (cb) ->
  model.findAll()
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

update = (id, restaurant, cb) ->
  model.update
    cname: restaurant.cname
    place: restaurant.place
    img: restaurant.img
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

module.exports = { init, create, find, findAll, update, destory }
