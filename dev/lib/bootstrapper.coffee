'use strict'

app = require './app'
helper = require './helper'

module.exports = class Bootstrapper
    getApp: ->
        @app
    initConfig: ->
        console.log 'InitConfig loaded'
        @config = require '../config.json'
        return
    initApp: ->
        console.log 'InitApp loaded'
        @app = new app
        @app.set 'port', @config.port
        return
    initHelper: ->
        console.log 'InitHelper loaded'
        @helper = new helper
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
