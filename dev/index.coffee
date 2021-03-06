'use strict'

boostrapper = require './lib/bootstrapper'

module.exports = class Server
    bootstrap: (@bootstrap) ->
        @
    getBootstrapper: ->
        new boostrapper()
    run: (callback) ->
        if typeof @bootstrapper is 'undefined'
            @bootstrapper = @getBootstrapper()

        @bootstrapper.run()

        if typeof callback isnt 'undefined'
            @bootstrapper.getApp().run callback

        return
