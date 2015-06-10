orderService = require './orderService'
staffService = require './staffService'

assign = ->
  # order.getTodayOrder > staff.getTodaySatff > analytic > report todayWorkerMapping

module.exports =
  assign: assign
