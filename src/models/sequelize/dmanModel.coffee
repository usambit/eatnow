Sequelize = require 'sequelize'

model = null

init = (sequelize) ->
  model = sequelize.define 'dmans',
    id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
    cname:
      type: Sequelize.STRING
      allowNull: no
    phone:
      type: Sequelize.STRING
      allowNull: no
  , indexes: [
      fields: ['cname']
    ]


create = (dman, cb) ->
  model.create
    cname: meal.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (dman, cb) ->
  model.create
    phone: meal.phone
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

findAll = (cb) ->
  model.find
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

update =(cname,cb) ->
  model.update
    cname:meal.cname
    where:
      cname: meal.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(phone,cb) ->
  model.update
    price:meal.price
    where:
      price: dman.price
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(cname) ->
  model.destory
    where:
      cname: dman.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

destory =(phone) ->
  model.destory
  where:
    phone: dman.phone
  .then (data) ->
    cb null, data
  , (err) ->
    cb err


module.exports = { init, create, find, findAll , update , destory}
