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
  pw:
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
    sid: account.sid
    pw: account.pw
    cname: account.cname
    phone: account.phone
    email: account.email
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

find = (account, cb) ->
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

update =(account,cb) ->
  model.update
    sid: account.sid
    pw: account.pw
    cname: account.cname
    phone: account.phone
    email: account.email
    where:
      sid: account.sid
      pw: account.pw
      cname: account.cname
      phone: account.phone
      email: account.email
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err


module.exports = { init, create, find, findAll , update}
