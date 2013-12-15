Collection = require('gauss').Collection
Vector = require('gauss').Vector
_ = require 'lodash'


class SeriesProcessor

  @data
  @currentTimestamp
  @currentValue
  @TAU


  constructor: (@TAU) ->
    @data = new Collection()


  processData: (timestamp, value) ->
    @insertData(timestamp, value)
    @processRow()


  insertData: (timestamp, value) ->
    @currentTimestamp = timestamp
    @currentValue = value

    row =
      timestamp: @currentTimestamp
      value: @currentValue

    @data.push row


  processRow: () ->
    @removeUnnecesaryData()

    result =
      timestamp: @currentTimestamp
      value: @currentValue
      min: _.min(@data,  'value').value
      max: _.max(@data, 'value').value
      sum: _.reduce @data, (sum, row) ->
        return sum + row.value
      , 0
      nb: @data.length

    result

  removeUnnecesaryData: ()->
    minTimestamp = @currentTimestamp - @TAU
    lastIndex = @data.indexBy (row) ->
      row.timestamp >= minTimestamp

    @data.splice 0, lastIndex


module.exports = SeriesProcessor