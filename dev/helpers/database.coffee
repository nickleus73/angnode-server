A'use strict'

mongoose = require 'mongoose'

module.exports = class Database
    constructor: ->
        @app = arguments[0]

        host = 'localhost'
        port = 27017
        database = 'app'

        @uri = 'mongodb://' + host + ':' + port + ':' + database

        return
    run: ->
        that = @

        @app.get('logger').info 'Helper loaded', {
            name: 'Database'
        }

        con = mongoose.connect @uri

        connect = con.connection

        connect.on 'error', (e) ->
            that.app.get('logger').error 'error connection to database', {
                error: e
            }
            return

        connect.on 'open', ->
            that.app.get('logger').info 'connection to database opend'

            that.app.get('event').emit 'connection to database ready', that.app
            return

        connect.on 'close', ->
            that.app.get('logger').warn 'connection to database close'

            that.app.get('event').emit 'connection to database close'
            return
        return
