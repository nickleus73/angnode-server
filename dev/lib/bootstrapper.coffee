'use strict'

module.exports = class Bootstrapper
    initConfig: ->
        @config = require '../config.json'
        return
    initApp: ->
        return
    initHelper: ->
        return
    run: (obj) ->
        if typeof obj is 'undefined'
            obj = Bootstrapper

        for prop, i of obj.prototype
            prefix = prop.substr 0, 4
            if prefix is 'init'
                @[prop]()
        return
