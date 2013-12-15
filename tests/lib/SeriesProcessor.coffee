should = require('chai').should()
SeriesProcessor = require '../../lib/SeriesProcessor'


describe 'processData', ->

  processedData = {}

  beforeEach (done)->
    seriesProcessor = new SeriesProcessor(5)

    seriesProcessor.processData('1', 1.0)
    seriesProcessor.processData('2', 10.0)
    seriesProcessor.processData('5', 11.0)
    processedData = seriesProcessor.processData('7', 12.0)

    done()


  it 'should return proper timestamp', (done)->
    processedData.timestamp.should.eql('7')

    done()


  it 'should calculate properly sum', (done)->
    processedData.sum.should.eql(23)

    done()


  it 'should calculate properly min value', (done)->
    processedData.min.should.eql(11)

    done()


  it 'should calculate properly max value', (done)->
    processedData.max.should.eql(12)

    done()


  it 'should calculate properly number of rows', (done)->
    processedData.nb.should.eql(2)

    done()


describe 'removeUnnecesaryData', ->

  seriesProcessor = {}

  beforeEach (done)->
    seriesProcessor = new SeriesProcessor(5)

    seriesProcessor.insertData('1', 1.0)
    seriesProcessor.insertData('2', 10.0)
    seriesProcessor.insertData('5', 11.0)
    seriesProcessor.insertData('6', 12.0)
    seriesProcessor.insertData('7', 12.0)

    done()


  it 'should remove 2 rows', (done)->
    data = seriesProcessor.removeUnnecesaryData()
    data.length.should.eql(2)

    done()

  it 'should remove rows with proper timestamp', (done)->
    data = seriesProcessor.removeUnnecesaryData()

    data[0].timestamp.should.eql('1')
    data[1].timestamp.should.eql('2')

    done()

  it 'should leave 3 rows', (done)->
    seriesProcessor.removeUnnecesaryData()
    data = seriesProcessor.getData()
    data.length.should.eql(3)

    done()

  it 'should leave rows with proper timestamp', (done)->
    seriesProcessor.removeUnnecesaryData()
    data = seriesProcessor.getData()

    data[0].timestamp.should.eql('5')
    data[1].timestamp.should.eql('6')
    data[2].timestamp.should.eql('7')

    done()