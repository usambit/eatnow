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
    cname: restaurant.cname
    place: restaurant.place
    img: restaurant.img
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

update =(restaurant,cb) ->
  model.update
    cname: restaurant.cname
    place: restaurant.place
    img: restaurant.img
    where:
      cname: restaurant.cname
      place: restaurant.place
      img: restaurant.img
  .then (data) ->
    cb null, data
  ,(err) ->
    cb err

destory =(restaurant) ->
  model.destory
    where:
      id: restaurant.id
      cname: restaurant.cname
      place: restaurant.place
      img: restaurant.img
  .then (data) ->
    cb null, data
  , (err) ->
    cb err

module.exports = { init, create, find, findAll , update , destory}
