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


  getData: () ->
    @data


  processData: (timestamp, value) ->
    @insertData(timestamp, value)
    @removeUnnecesaryData()
    @processRow()


  insertData: (timestamp, value) ->
    @currentTimestamp = timestamp
    @currentValue = value

    row =
      timestamp: @currentTimestamp
      value: @currentValue

    @data.push row


  processRow: () ->
    result =
      timestamp: @currentTimestamp
      value: @currentValue
      min: _.min(@data,  'value').value.toFixed(5)
      max: _.max(@data, 'value').value.toFixed(5)
      sum: _.reduce(@data, (sum, row) ->
        sum + row.value
      , 0).toFixed(5)
      nb: @data.length

    result


  removeUnnecesaryData: ()->
    minTimestamp = @currentTimestamp - @TAU
    lastIndex = @data.indexBy (row) ->
      row.timestamp > minTimestamp

    @data.splice 0, lastIndex


module.exports = SeriesProcessor