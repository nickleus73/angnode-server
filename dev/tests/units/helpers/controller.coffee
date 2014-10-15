'use strict'
assert = require 'assert'

server = require '../../helpers/controller'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'Helper::Controller tests methods':
                'Helper::Controller:contructor should be a function': ->
                    console.log 'Cool'
                    return

)()
