fs = require 'fs'
rl = require('readline');

class FileStream

  @inputStream
  @lineStream

  constructor: (@filePath)->

    @inputStreamOptions =
      flags: 'r',
      encoding: "utf-8",
      fd: null,
      mode: "0666",
      bufferSize: 64 * 1024

    @lineStreamOptions =
      input: @createInputStream(),
      output: process.stdout,
      terminal: false

    @createLineStream()


  createInputStream: ()->
    @inputStream = fs.createReadStream(@filePath, @inputStreamOptions)

  createLineStream: ()->
    @lineStream = rl.createInterface @lineStreamOptions

  writeLine: (string)->
    fs.appendFileSync @filePath, string

  onOpen: (callback) ->
    @inputStream.on 'open', () ->
      callback()

  onError: (callback) ->
    @inputStream.on 'error', (error) ->
      callback(error)

  onLine: (callback) ->
    @lineStream.on 'line', (line) ->
      callback(line)


module.exports = FileStream