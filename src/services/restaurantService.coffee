restaurantModel = require '../models/sequelize/restaurantModel'
menuModel = require '../models/sequelize/menuModel'

###
[{
  rid: 'aa-aa-aa-aa'
  name: 'A1'
  menu: [{
    'name': 'AA1',
    'price': 12
  }, {
    'name': 'AA1',
    'price': 12
  }]
}, {
  rid: 'aa-aa-aa-aa'
  name: 'A1'
  menu: [{
    'name': 'AA1',
    'price': 12
  }, {
    'name': 'AA1',
    'price': 12
  }]
}]
###
getList = (cb) ->
  cb null, [
    id: 'aa-aa-aa-aa'
    name: 'A1'
    menu: [
      'name': 'AA1',
      'price': 12
    ,
      'name': 'AA1',
      'price': 12
    ]
  ,
    id: 'aa-aa-aa-aa'
    name: 'A1'
    menu: [
      'name': 'AA1',
      'price': 12
    ,
      'name': 'AA1',
      'price': 12
    ]
  ]

  findResult = (err, data) ->
    if err
      cb err
    else
      console.log data
      rtn = for restaurant in data
        id: data.id,
        name: data.cname
      cb null, rtn

  #restaurantModel.findAll findResult


getRestaurant = (rid, cb) ->
  cb null,
    id: 'aa-aa-aa-aa'
    name: 'A1'
    menu: [
      'name': 'AA1',
      'price': 12
    ,
      'name': 'AA1',
      'price': 12
    ]
  # restaurantModel.findAll
  # menuModel.findByRid rid

addRestaurant = (record, cb) ->
  cb null
  restaurantModel.save

saveRestaurant = (rid, record) ->
  # restaurantModel.save

modifyRestaurant = (rid, record) ->

module.exports = { getList, getRestaurant, addRestaurant, saveRestaurant, modifyRestaurant }
