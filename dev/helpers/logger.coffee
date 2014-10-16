'use strict'

winston = require 'winston'
path = require 'path'
fs = require 'fs'

module.exports = class Logger
    constructor: ->
        @app = arguments[0]

        @default_path = './var/log'

        try
            stats = fs.existsSync(path.resolve @default_path)

            if stats is false
                try
                    fs.mkdirSync path.resolve @default_path
                catch e
                    console.log e
        catch e
            console.log e

        @initLogger()
        return
    initLogger: ->
        d = new Date

        curr_date = d.getDate()
        curr_month = d.getMonth()
        curr_year = d.getFullYear()

        date_format = curr_date + '-' + curr_month + '-' + curr_year

        @logger = new (winston.Logger)({
            transports: [
                new winston.transports.Console(),
                new winston.transports.File({
                    filename: path.resolve @default_path + '/log-' + date_format + '.log'
                })
            ],
            exceptionHandlers: [
                new winston.transports.File({
                    filename: path.resolve @default_path + '/exceptions-' + date_format + '.log'
                })
            ]
        })

        @app.set 'logger', @logger

        return
    run: ->
        @logger.info 'Helper loaded', {
            name: 'Logger'
        }
        return
