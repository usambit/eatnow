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
    cname: dman.cname
    phone: dman.phone
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

update =(dman,cb) ->
  model.update
    cname: dman.cname
    phone: dman.phone
    where:
      cname: meal.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(dman) ->
  model.destory
    where:
      cname: dman.cname
      phone: dman.phone
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

module.exports = { init, create, find, findAll , update , destory}
