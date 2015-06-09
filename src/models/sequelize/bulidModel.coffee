Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'bulids',
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
  , indexes: [
      fields: ['cname']
    ]


create = (bulid, cb) ->
  model.create
    cname: bulid.cname
    start: bulid.start
    end: bulid.end
    time: bulid.time
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
    cname: bulid.cname
    start: bulid.cname
    end: bulid.end
    time: bulid.time
    where:
      cname: bulid.cname
      start: bulid.cname
      end: bulid.end
      time: bulid.time
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(bulid) ->
  model.destory
    where:
      cname: bulid.cname
      start: bulid.start
      end: bulid.end
      time: bulid.time
  .then (data) ->
    cb null, data
  , (err) ->
    cb err


module.exports = { init, create, find, findAll , update , destory}
