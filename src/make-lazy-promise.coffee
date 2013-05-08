makePromise = require "make-promise"

module.exports = (fn) ->
  realPromise = null
  then: (onFulfilled, onRejected) ->
    realPromise = realPromise or makePromise (fulfill, reject) -> fn fulfill, reject
    realPromise.then onFulfilled, onRejected