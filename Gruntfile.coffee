module.exports = (grunt) ->
    require('load-grunt-tasks')(grunt)

    grunt.initConfig
        coffee:
            main:
                options:
                    bare: true
                files:
                    'index.js': 'dev/index.coffee'
                    'lib/bootstrapper.js': 'dev/lib/bootstrapper.coffee'
                    'lib/app.js': 'dev/lib/app.coffee'
                    'lib/helper.js': 'dev/lib/helper.coffee'
                    'helpers/controller.js': 'dev/helpers/controller.coffee'
                    'helpers/model.js': 'dev/helpers/model.coffee'
                    'helpers/logger.js': 'dev/helpers/logger.coffee'
                    'helpers/database.js': 'dev/helpers/database.coffee'
                    'helpers/app.js': 'dev/helpers/app.coffee'
                    'tests/index.js': 'dev/tests/index.coffee'
                    'tests/units/index.js': 'dev/tests/units/index.coffee'
                    'tests/units/lib/bootstrapper.js': 'dev/tests/units/lib/bootstrapper.coffee'
                    'tests/units/lib/app.js': 'dev/tests/units/lib/app.coffee'
                    'tests/units/lib/helper.js': 'dev/tests/units/lib/helper.coffee'
                    'tests/units/helpers/controller.js': 'dev/tests/units/helpers/controller.coffee'
            bin:
                options:
                    bare: true
                files:
                    'dev/bin/dist/load-any-fixture.js': 'dev/bin/load-any-fixture.coffee'
        copy:
            dist:
                files: [
                    { filter: 'isFile', src: 'dev/config.json', dest: 'config.json' }
                    { filter: 'isFile', src: 'dev/tests/config.json', dest: 'tests/config.json' }
                ]
        header:
            dist:
                options:
                    text: '#!/usr/bin/env node'
                files:
                    'bin/load-any-fixture.js': 'dev/bin/dist/load-any-fixture.js'
        flo:
            serve:
                options:
                    port: 9000
                    dir: './'
                    glob: []
                    resolvers: [{
                        files: [
                            'dev/*.coffee',
                            'dev/**/*.coffee',
                            'dev/**/**/*.coffee',
                            'dev/tests/*.coffee',
                            'dev/tests/**/*.coffee',
                            'dev/tests/**/**/*.coffee',
                        ]
                        tasks: ['coffee:*']
                        callback:
                            reload: true
                    }, {
                        files: [
                            'dev/bin/dist/*.js',
                        ]
                        tasks: ['header:*']
                    }, {
                        files: [
                            'dev/*.json',
                            'dev/tests/*.json',
                        ]
                        tasks: ['copy:*']
                        callback:
                            reload: true
                    }]

    grunt.registerTask 'default', ['flo']

    grunt.registerTask 'force', ['coffee', 'copy', 'header']
