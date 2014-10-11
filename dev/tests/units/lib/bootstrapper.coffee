'use strict'
assert = require 'assert'


bootstrapper = require '../../../lib/bootstrapper'

module.exports = ( ->
    (suite) ->
        suite.addBatch {
            'Bootstrapper tests methods':
                'Bootstrapper:initConfig should be a function': ->
                    b = new bootstrapper()
                    assert.isFunction b.initConfig
                    return
                'Bootstrapper:initConfig should set config propertie': ->
                    b = new bootstrapper()
                    b.initConfig()
                    assert.isObject b.config
                    return
                'Bootstrapper:initApp should be a function': ->
                    b = new bootstrapper()
                    assert.isFunction b.initApp
                    return
                'Bootstrapper:initHelper should be a function': ->
                    b = new bootstrapper()
                    assert.isFunction b.initHelper
                    return
                'Bootstrapper:run should be a function': ->
                    b = new bootstrapper()
                    assert.isFunction b.run
                    return
        }
)()
