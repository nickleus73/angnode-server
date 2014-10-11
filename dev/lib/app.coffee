'use strict'

express = require 'express'
events = require 'events'

module.exports = class App
    constructor: ->
        @app = express()
        @app.set 'event', new events.EventEmitter
        return
    set: (key, value) ->
        @app.set key, value
        @
    get: (key) ->
        if typeof key is 'undefined'
            return null

        value = @app.get key

        if typeof value is 'undefined'
            return null

        value
    setHelpers: (app) ->
        helpers = @get 'helpers'
        helpers.initHelper app
        return
    run: (callback) ->
        return
