'use strict'
path = require 'path'
fs = require 'fs'

module.exports = class Controller
    constructor: ->
        @app = arguments[0]

        @default_path = './controllers'
        return
    run: ->
        console.log 'Run controller helper'
        base_path_controller = path.resolve @default_path

        files = fs.readdirSync base_path_controller

        n = files.length - 1

