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
                'Helper::Controller:default_path should be equal "./api/controllers"': ->
                    c = new controller
                    return
)()
