FileStream = require './lib/FileStream'
SeriesProcessor = require './lib/SeriesProcessor'
outputConverter = require './helpers/outputConverter'


inputFile = process.argv[2]
outputFile = process.argv[3]

inputStream = new FileStream(inputFile)
outputStream = new FileStream(outputFile)
seriesProcessor = new SeriesProcessor(60)

inputStream.onOpen () ->
  console.log 'Processing...'

inputStream.onError (error) ->
  throw error

inputStream.onLine (line) ->
  values = line.split /\s/g
  processedData = seriesProcessor.processData(values[0], parseFloat(values[1]))
  outputStream.writeLine(outputConverter.objectToString(processedData))


