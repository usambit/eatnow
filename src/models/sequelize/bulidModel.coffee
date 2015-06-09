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
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (bulid, cb) ->
  model.create
    start: bulid.start
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (bulid,cb) ->
  model.create
    end: bulid.end
  .then (data) ->
    cb null,data
  , (err) ->
    cb err

create = (bulid,cb) ->
  model.create
    time: bulid.time
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

find = (cname, cb) ->
  model.find
    where:
      end: end
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (start, cb) ->
  model.find
    where:
      start: start
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (end, cb) ->
  model.find
    where:
      end: end
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (time, cb) ->
  model.find
    where:
      time: time
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
    where:
      cname: bulid.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(start,cb) ->
  model.update
    start: bulid.start
    where:
      start: bulid.start
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(end,cb) ->
  model.update
    end: bulid.end
    where:
      end: bulid.end
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(time,cb) ->
  model.update
    time: bulid.time
    where:
      time: bulid.time
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(cname) ->
  model.destory
    where:
      cname: bulid.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

destory =(start) ->
  model.destory
  where:
    start: bulid.start
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

destory =(end) ->
  model.destory
    where:
      end: bulid.end
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

destory =(time) ->
  model.destory
    where:
      time: bulid.time
  .then (data) ->
    cb null, data
  , (err) ->
    cb err



module.exports = { init, create, find, findAll , update , destory}
