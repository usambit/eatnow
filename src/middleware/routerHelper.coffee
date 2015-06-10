Response = require '../models/responseModel'

handleSuccess = (req, res, next) ->
  res.status(200).json res.body

handleError = (err, req, res, next) ->
  console.log '7', err, req.body
  res.status(300).json new Response('FAILURE').getBody()


module.exports = { handleSuccess, handleError }
