'use strict'

_ = require 'underscore'
app = require './app'
helper = require './helper'

module.exports = class Bootstrapper
    extendConfig: (obj) ->
        initial_config = require '../config.json'
        if typeof obj is 'undefined'
            return initial_config
        return _.extend initial_config, obj
    getApp: ->
        @app
    initConfig: ->
        console.log 'InitConfig loaded'
        @config = @extendConfig()
        return
    initApp: ->
        console.log 'InitApp loaded'
        @app = new app
        @app.set 'port', @config.port
        return
    initHelper: ->
        console.log 'InitHelper loaded'
        @helper = new helper
        @helper.setPathes @config.path['helper directories']
        @helper.getHelpers()

        @app.set 'helper', @helper
        return
    run: (obj) ->
        if typeof obj is 'undefined'
            obj = Bootstrapper

        for prop, i of obj.prototype
            prefix = prop.substr 0, 4
            if prefix is 'init'
                @[prop]()
        return
