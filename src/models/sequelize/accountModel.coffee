Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'accounts',
    id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
    sid:
      type: Sequelize.STRING
      allownull:no
    pw:
      type: Sequelize.STRING
      allownull:no
    cname:
      type: Sequelize.STRING
      allowNull: no
    phone:
      type: Sequelize.STRING
      allownull: no
    email:
      type: Sequelize.STRING
      allownull: no
  ,
    indexes: [
      fields: ['sid']
    ]

create = (account, cb) ->
  model.create
    sid: account.sid
    pw: account.pw
    cname: account.cname
    phone: account.phone
    email: account.email
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

findBySid = (sid, cb) ->
  model.model.findAll
    where:
      sid: sid
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

update = (account, cb) ->
  model.update
    sid: account.sid
    pw: account.pw
    cname: account.cname
    phone: account.phone
    email: account.email
  ,
    where:
      id: id
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err


module.exports = { init, create, find, findBySid, findAll, update }
