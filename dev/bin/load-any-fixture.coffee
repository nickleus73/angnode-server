#!/usr/bin/env node

path = require 'path'
fs = require 'fs'

base_path = './data/fixtures'
fixture_file = 'fixture.js'
args = process.argv.slice 2

if typeof args[0] is 'undefined'
    console.warn 'You must enter an argument.'
else
    fixture_name = args[0]

    fixture_path = path.resolve path.join base_path, fixture_name
    file_path = path.join fixture_path, fixture_file

    stats = fs.existsSync(file_path)

    if stats is true
        require file_path
    else
        console.warn "The fixture : " + fixture_name + " doesn't exists."
