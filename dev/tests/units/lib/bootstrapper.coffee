'use strict'
assert = require 'assert'


bootstrapper = require '../../../lib/bootstrapper'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'Bootstrapper tests methods':
                'Bootstrapper:getApp should be a function': ->
                    b = new bootstrapper()
                    assert.isFunction b.getApp
                    return
                'Bootstrapper:getApp should return a function': ->
                    b = new bootstrapper()
                    b.run()
                    assert.isObject b.getApp()
                    return
                'Bootstrapper:getApp should call run function': ->
                    b = new bootstrapper()
                    b.run()
                    assert.isFunction b.getApp().run
                    return
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
                'Bootstrapper:initApp should initialize app property': ->
                    b = new bootstrapper()
                    b.run()
                    assert.isObject b.app
                    return
                'Bootstrapper:initApp should be equal 3000': ->
                    b = new bootstrapper()
                    b.run()
                    assert.equal b.app.get('port'), 3000
                    return
                'Bootstrapper:run should launch process and return port to be equal 3000': ->
                    b = new bootstrapper()
                    b.run()
                    assert.equal b.app.get('port'), 3000
                    return
        .addBatch
            'Bootstrapper tests getApp().run methods':
                topic: ->
                    b = new bootstrapper()
                    b.run()

                    b.getApp().set 'port', 3333
                    b.getApp().run @callback
                    return
                'Bootstrapper.getApp().run should return a function then an object': (app, server, e) ->
                    assert.isFunction app
                    assert.isObject server
                    return
                'Bootstrapper.getApp().get "helper" should return an object': (app, server, e) ->
                    assert.isObject app.get 'helper'
                    return
)()
