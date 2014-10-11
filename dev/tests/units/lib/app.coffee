'use strict'
assert = require 'assert'


app = require '../../../lib/app'

module.exports = ( ->
    (suite) ->
        suite.addBatch {
            'Bootstrapper tests methods':
                'Bootstrapper:set should be a function': ->
                    a = new app()
                    assert.isFunction a.set
                    return
                'Bootstrapper:app should be a object': ->
                    a = new app()
                    assert.isFunction a.app
                    return
                'Bootstrapper:set should return an object': ->
                    a = new app()
                    assert.isObject a.set()
                    return
                'Bootstrapper:get should be equal 1': ->
                    a = new app()
                    a.set 'test', 1
                    value = a.get 'test'
                    assert.equal value, 1
                    return
                'Bootstrapper:get should have event object': ->
                    a = new app()
                    value = a.get 'event'
                    assert.isObject value
                    return
                'Bootstrapper:get should be null': ->
                    a = new app()
                    value = a.get 'tester'
                    assert.isNull value
                    return
                'Bootstrapper:get should be a function': ->
                    a = new app()
                    assert.isFunction a.get
                    return
                'Bootstrapper:get should return null': ->
                    a = new app()
                    assert.isNull a.get()
                    return
                'Bootstrapper:setHelpers should be a function': ->
                    a = new app()
                    assert.isFunction a.setHelpers
                    return
                'Bootstrapper:run should be a function': ->
                    a = new app()
                    assert.isFunction a.run
                    return
        }
)()
