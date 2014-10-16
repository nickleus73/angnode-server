'use strict'
path = require 'path'
fs = require 'fs'

module.exports = class Helper
    addPath: (p) ->
        if typeof @pathes is 'undefined'
            @pathes = []

        if typeof p is 'undefined'
            return

        @pathes.push p
        return
    getPath: (index) ->
        if typeof @pathes is 'undefined'
            return null

        if typeof index is 'undefined'
            return @pathes

        if typeof @pathes[index] is 'undefined'
            return null

        @pathes[index]
    setPathes: (pathes) ->
        for p in pathes
            @addPath p
        return
    getHelpers: ->
        @helpers_pathes = []

        pathes = @getPath()
        n = pathes.length - 1

        for p in pathes
            p = path.resolve path.join __dirname, p
            files = fs.readdirSync p
            n_files = files.length - 1

            if n_files isnt -1
                for file in files
                    if file.substr -3 is '.js'
                        @helpers_pathes.push path.join p, file
        return
    getHelpersInitialized: ->
        @h
    initHelpers: (app) ->
        event = app.get 'event'
        @h = []

        n = @helpers_pathes.length - 1

        for helper_file in @helpers_pathes
            try
                helper = require helper_file

                @h.push new helper app

                if n-- is 0
                    console.log 'All helper initialized'
                    event.emit 'all helpers loaded', @, app
            catch e

        return
