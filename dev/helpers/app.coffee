'use strict'
path = require 'path'
express = require 'express'
body_parser = require 'body-parser'

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

        @app.use body_parser.json()

        @app.use body_parser.urlencoded {
            extended: true
        }
        return
