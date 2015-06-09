Sequelize =  require 'sequlize'

model = null

init = (squlize) ->
  model = sequelize.define 'restaurants',
  id:
      primaryKey: yes
      type: Sequelize.UUID
      defaultValue: Sequelize.UUIDV1
      allowNull: no
  cname:
      type: Sequelize.STRING
      allowNull: no
  place:
      type: sequelize.STRING
      allownull: no
  img:
    type: sequelize.STRING
    allownull: no
  , index: [
      fields; ['cname']
    ]

    create = (restaurant, cb) ->
  model.create
    cname: meal.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (restaurant, cb) ->
  model.create
    place: meal.place
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

create = (restaurant,cb) ->
  model.create
    img: meal.img
  .then (data) ->
    cb null,data
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

find = (place, cb) ->
  model.find
    where:
      place: place
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
    cname: meal.cname
    where:
      cname: meal.cname
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

update =(place,cb) ->
  model.update
    place: meal.place
    where:
      place: meal.place
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(cname) ->
  model.destory
    where:
      cname: meal.cname
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

destory =(place) ->
  model.destory
  where:
    place: meal.place
  .then (data) ->
    cb null, data
  , (err) ->
    cb err


module.exports = { init, create, find, findAll , update , destory}
