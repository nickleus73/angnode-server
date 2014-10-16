'use strict'

path = require 'path'
fs = require 'fs'

module.exports = class Model
    constructor: ->
        @app = arguments[0]

        @default_path = './api/models'

        return
    run: ->
        @app.get('logger').info 'Helper loaded', {
            name: 'Model'
        }

        base_path_model = path.resolve @default_path

        files = fs.readdirSync base_path_model

        n = files.length - 1

        if n isnt -1
            for file in files
                if file.substr -3 is '.js'
                    try
                        require path.join base_path_model, file
                    catch e
                        console.log e

        return
