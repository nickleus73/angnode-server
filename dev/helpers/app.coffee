'use strict'
path = require 'path'
express = require 'express'
body_parser = require 'body-parser'

module.exports = class App
    constructor: ->
        @app = arguments[0]

        @default_path = './public'
        return
    getModel: (model_name) ->
        console.log @app.get 'con'
    run: ->
        that = @
        @app.get('logger').info 'Helper loaded', {
            name: 'App'
        }

        @app.use express.static path.resolve @default_path

        @app.use body_parser.json()

        @app.use body_parser.urlencoded {
            extended: true
        }

        @app.set 'CONSTANTS_TYPE',  {
            SUCCESS: 0
            INFO: 1
            WARNING: 2
            CRITICAL: 3
        }

        @app.set 'get_model', (model_name) ->
            if typeof model_name is 'undefined'
                console.error 'get_model method must have 1 argument'
                return

            model_name = model_name.charAt(0).toUpperCase() + model_name.slice(1).toLowerCase();
            model_name = model_name + 'Model'

            con = that.app.get('database').connection

            con.models[model_name]
        return
