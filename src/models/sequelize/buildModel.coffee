Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'builds',
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
  ,
    indexes: [
      fields: ['cname']
    ]


create = (build, cb) ->
  model.create
    cname: build.cname
    start: build.start
    end: build.end
    time: build.time
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

update = (id, build, cb) ->
  model.update
    cname: build.cname
    start: build.cname
    end: build.end
    time: build.time
  ,
    where:
      id: id
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destroy = (id) ->
  model.destroy
    where:
      id: id
  .then (data) ->
    cb null, data
  , (err) ->
    cb err


module.exports = { init, create, find, findAll, update, destroy }
