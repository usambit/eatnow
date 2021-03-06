Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'rooms',
    id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
    cname:
      type: Sequelize.STRING
      allowNull: no
    start:
      type: Sequelize.STRING
      allowNull: no
    end:
      type: Sequelize.STRING
      allowNull: no
    time:
      type: Sequelize.INTEGER
      allowNull: no
    buildName:
      type: Sequelize.STRING
      allowNull: no
  ,
    indexes: [
      fields: ['cname']
    ]


create = (room, cb) ->
  model.create
    cname: room.cname
    start: room.start
    end: room.end
    time: room.time
    bulidName: room.bulidName
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

update = (room, cb) ->
  model.update
    cname: room.cname
    start: room.start
    end: room.end
    time: room.time
    bulidName: room.bulidName
  ,
    where:
      cname: room.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destroy = (room) ->
  model.destroy
    where:
      cname: room.cname
      cname: room.cname
      start: room.start
      end: room.end
      time: room.time
      cname: room.bulidName
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

module.exports = { init, create, find, findAll, update, destroy }
