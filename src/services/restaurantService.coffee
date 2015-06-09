restModel = require '../models/sequelize/restaurantModel'
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
  getRestCb = (err, rdata) ->
    if err
      cb err
    else

      if(rdata.length is 0)
        cb()

      rtn = []
      for rest, i in rdata
        rtn.push
          id: rest.id
          cname: rest.cname
          place: rest.place
          img: rest.img
          menu: []

        _i = i
        getMenuCb = (err, mdata) ->
          if err
            cb err
          else
            rtn[_i].menu = for menu in mdata
              id: menu.id
              cname: menu.cname
              price: menu.price
            cb null, rtn

        menuModel.findByRid rest.id, getMenuCb

  restModel.findAll getRestCb


getRest = (rid, cb) ->
  getRestCb = (err, rdata) ->
    if err
      cb err
    else

      if(!rdata)
        cb()

      rtn =
        id: rdata.id
        cname: rdata.cname
        place: rdata.place
        img: rdata.img
        menu: []

      getMenuCb = (err, mdata) ->
        if err
          cb err
        else
          rtn.menu = for menu in mdata
            id: menu.id
            cname: menu.cname
            price: menu.price
          cb null, rtn

      menuModel.findByRid rdata.id, getMenuCb

  restModel.find rid,getRestCb


addRest = (o, cb) ->
  r =
    cname: o.cname
    place: o.place
    img: o.img

  modelCb = (err, data) ->
    if err
      cb err
    else
      cb null

  restModel.create r, modelCb

saveRest = (o, cb) ->
  r =
    cname: o.cname
    place: o.place
    img: o.img

  modelCb = (err, data) ->
    if err
      cb err
    else
      cb null

  restModel.update o.id, r, modelCb

delRest = (o, cb) ->
  modelCb = (err, data) ->
    if err
      cb err
    else
      cb null

  restModel.destory o.id, modelCb


addMenu = (o, cb) ->
  r =
    cname: o.cname
    price: o.price
    restaurantId: o.restaurantId

  modelCb = (err, data) ->
    if err
      cb err
    else
      cb null

  menuModel.create r, modelCb

saveMenu = (o, cb) ->
  r =
    cname: o.cname
    price: o.price
    restaurantId: o.restaurantId

  modelCb = (err, data) ->
    if err
      cb err
    else
      cb null
  menuModel.update o.id, r, modelCb

delMenu = (o, cb) ->
  modelCb = (err, data) ->
    if err
      cb err
    else
      cb null

  menuModel.destory o.id, modelCb

module.exports = { getList, getRest, addRest, saveRest, delRest, addMenu, saveMenu, delMenu }
