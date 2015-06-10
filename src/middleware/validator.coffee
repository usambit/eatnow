util = require 'util'
Response = require '../models/responseModel'

checkReqParams = (keys) ->
  (req, res, next) ->
    params = if req.method.toLowerCase() is 'get' then req.query else req.body
    missing = keys.map (key)->
      if !params[key] then key

    if missing.length is 0
      next()
    else
      res.body = new Response('PARAMS_ERROR').getBody()
      next 'PARAMS_ERROR'

module.exports = { checkReqParams }
