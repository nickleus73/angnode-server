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
                    'tests/index.js': 'dev/tests/index.coffee'
                    'tests/units/index.js': 'dev/tests/units/index.coffee'
                    'tests/units/lib/bootstrapper.js': 'dev/tests/units/lib/bootstrapper.coffee'
                    'tests/units/lib/app.js': 'dev/tests/units/lib/app.coffee'
        copy:
            dist:
                files: [
                    { filter: 'isFile', src: 'dev/config.json', dest: 'config.json' }
                    { filter: 'isFile', src: 'dev/tests/config.json', dest: 'tests/config.json' }
                ]
        shell:
            options:
                stderr: false
            target:
                command: 'npm test'
        flo:
            serve:
                options:
                    port: 9999
                    dir: './'
                    glob: []
                    resolvers: [{
                        files: [
                            'dev/*.coffee',
                            'dev/**/*.coffee',
                            'dev/tests/*.coffee',
                            'dev/tests/**/*.coffee',
                            'dev/tests/**/**/*.coffee',
                        ]
                        tasks: ['coffee:*', 'shell:*']
                        callback:
                            reload: true
                    }, {
                        files: [
                            'dev/*.json',
                            'dev/tests/*.json',
                        ]
                        tasks: ['copy:*']
                        callback:
                            reload: true
                    }, {
                        files: [
                            'dev/tests/*.coffee',
                            'dev/tests/**/*.coffee',
                            'dev/tests/**/**/*.coffee',
                        ]
                        tasks: ['shell:*']
                    }]

    grunt.registerTask 'default', ['flo']

    grunt.registerTask 'force', ['coffee', 'copy']