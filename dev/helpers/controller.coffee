'use strict'
path = require 'path'
fs = require 'fs'

module.exports = class Controller
    constructor: ->
        @app = arguments[0]

        @default_path = './api/controllers'
        return
    run: ->
        @app.get('logger').info 'Helper loaded', {
            name: 'Controller'
        }

        base_path_controller = path.resolve @default_path

        files = fs.readdirSync base_path_controller

        n = files.length - 1

        if n isnt -1
            for file in files
                if file.substr -3 is '.js'
                    try
                        controller = require path.join base_path_controller, file

                        if typeof controller is 'function'
                            controller @app
                    catch e

        return
