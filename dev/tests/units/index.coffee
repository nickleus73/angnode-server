'use strict'
assert = require 'assert'

server = require '../../index'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'Server tests methods':
                'Server:bootstrap should be a function': ->
                    s = new server()
                    assert.isFunction s.bootstrap
                    return
                'Server:bootstrap should return an object': ->
                    s = new server()
                    assert.isObject s.bootstrap()
                    return
                'Server:getBootstrapper should be a function': ->
                    s = new server()
                    assert.isFunction s.getBootstrapper
                    return
                'Server:getBootstrapper should be return an object': ->
                    s = new server()
                    assert.isObject s.getBootstrapper()
                    return
                'Server:getBootstrapper should be return an object with a run method': ->
                    s = new server()
                    assert.isFunction s.getBootstrapper().run
                    return
                'Server:run should be function': ->
                    s = new server()
                    assert.isFunction s.run
                    return
        .addBatch
            'Server test run method':
                topic: ->
                    s = new server()

                    s.run @callback
                    return
                'Server:run should return function and object': (app, server, e) ->
                    assert.isFunction app
                    assert.isObject server
                    return
)()
