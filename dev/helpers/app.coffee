'use strict'
path = require 'path'
express = require 'express'

module.exports = class App
    constructor: ->
        @app = arguments[0]

        @default_path = './public'
        return
    run: ->
        @app.get('logger').info 'Helper loaded', {
            name: 'App'
        }

        @app.use express.static path.resolve @default_path
        return
