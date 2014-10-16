'use strict'
assert = require 'assert'

controller = require '../helpers/controller'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'Helper::Controller tests methods':
                'Helper::Controller:contructor should be a function': ->
                    assert.isFunction controller.constructor
                    return
                'Helper::Controller should be equal "/controllers"': ->
                    c = new controller 'app'
                    return
)()
