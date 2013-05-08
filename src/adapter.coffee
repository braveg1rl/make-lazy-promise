makeLazyPromise = require "./make-lazy-promise"

module.exports = 
  pending: ->
    localResolve = undefined
    localReject = undefined
    promise = makeLazyPromise (resolve, reject) ->
      localResolve = resolve
      localReject = reject
    promise.then (result) -> result
    return pending = 
      promise: promise
      fulfill: localResolve
      reject: localReject
