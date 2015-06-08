Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'restaurant',
    id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
    cname:
      type: Sequelize.STRING
      allowNull: no
  , indexes: [
      fields: ['cname']
    ]

create = (restaurant, cb) ->
  model.create
    cname: restaurant.cname
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

module.exports = { init, create, find, findAll }
