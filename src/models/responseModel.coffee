ResMap = {}

ResMap.SUCCESS      = code: '200', message: 'success'
ResMap.FAILURE      = code: '300', message: 'failure'
ResMap.PARAMS_ERROR = code: '400', message: 'parameter error'

ResBody = (code, message) ->
  @code    = code
  @message = message

class Response
  constructor: ->
    if arguments.length == 1 and ResMap[arguments[0]]
      code = ResMap[arguments[0]].code
      message = ResMap[arguments[0]].message
    else
      code = (arguments[0] or '').code
      message = (arguments[1] or '').message

    @body = new ResBody code, message

  getBody: ->
    @body

  setData: (key, value) ->
    @body[key] = value

module.exports = Response;
