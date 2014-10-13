'use strict'
path = require 'path'

module.exports = class Helper
    addPath: (path) ->
        if typeof @pathes is 'undefined'
            @pathes = []

        if typeof path is 'undefined'
            return

        @pathes.push path

        return
    getPath: (index) ->
        if typeof @pathes is 'undefined'
            return null

        if typeof index is 'undefined'
            return @pathes

        console.log @pathes[index]
        if typeof @pathes[index] is 'undefined'
            return null

        @pathes[index]
    setPathes: (pathes) ->
        for path in pathes
            @addPath path
        return
    initHelpers: ->
        return
