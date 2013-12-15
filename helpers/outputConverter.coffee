module.exports =
  objectToString: (object) ->
    objectToString(object)


objectToString = (object) ->
  return "#{object.timestamp} #{object.value} #{object.nb} #{object.sum.toString()} #{object.min.toString()} #{object.max.toString()} \n"
