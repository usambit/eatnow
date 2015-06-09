Sequelize =  require 'sequlize'

model = null

init = (squlize) ->
  model = sequelize.define 'accounts',
  id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
  sid:
      type: sequelize.STRING
      allownull:no
  cname:
      type: Sequelize.STRING
      allowNull: no
  phone:
      type: sequelize.STRING
      allownull: no
  email:
    type: sequelize.STRING
    allownull: no
  , index: [
      fields; ['sid']
    ]

create = (account, cb) ->
  model.create
    sid: meal.sid
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (account, cb) ->
  model.create
    cname: meal.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (account, cb) ->
  model.create
    phone: meal.phone
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (account,cb) ->
  model.create
    email: meal.email
  .then (data) ->
    cb null,data
  , (err) ->
    cb err

find = (sid, cb) ->
  model.find
    where:
      sid: sid
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (cname, cb) ->
  model.find
    where:
      cname: cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (phone, cb) ->
  model.find
    where:
      phone: phone
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (email, cb) ->
  model.find
    where:
      email: email
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

update =(sid,cb) ->
  model.update
    sid: meal.sid
    where:
      sid: meal.sid
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(cname,cb) ->
  model.update
    cname: meal.cname
    where:
      cname: meal.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(phone,cb) ->
  model.update
    phone: meal.phone
    where:
      phone: meal.phone
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(email,cb) ->
  model.update
    email: meal.email
    where:
      email: meal.email
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err


module.exports = { init, create, find, findAll , update}
