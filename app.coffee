FileStream = require './lib/FileStream'
SeriesProcessor = require './lib/SeriesProcessor'
outputConverter = require './helpers/outputConverter'


inputStream = new FileStream('./fixtures/data.txt')
outputStream = new FileStream('./output.txt')
seriesProcessor = new SeriesProcessor(60)

inputStream.onOpen () ->
  console.log 'Processing...'

inputStream.onError (error) ->
  throw error

inputStream.onLine (line) ->
  values = line.split /\s/g
  processedData = seriesProcessor.processData(values[0], values[1])
  outputStream.writeLine(outputConverter.objectToString(processedData))


