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
        @helpers = []

        pathes = @getPath()
        n = pathes.length - 1

        for p in @getPath()
            p = path.resolve path.join __dirname, p
            files = fs.readdirSync p
            n_files = files.length - 1

            if n_files isnt -1
                for file in files
                    if file.substr -3 is '.js'
                        @helpers.push path.join p, file
    initHelpers: (app) ->
        for helper_file in @helpers
            try
                helper = require helper_file

                h = new helper app
            catch e

        return
