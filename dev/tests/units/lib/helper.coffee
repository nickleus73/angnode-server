'use strict'
assert = require 'assert'


helper = require '../../../lib/helper'
config = require '../../../config.json'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'Helper tests methods':
                'Helper:addPath should be function': ->
                    h = new helper
                    assert.isFunction h.addPath
                    return
                'Helper:addPath should return array with 2 indexes': ->
                    h = new helper
                    h.addPath 'test1'
                    h.addPath 'test2'
                    assert.isArray h.pathes
                    assert.equal h.pathes.length, 2
                    return
                'Helper:getPath should be function': ->
                    h = new helper
                    assert.isFunction h.getPath
                    return
                'Helper:getPath should return array with 2 indexes': ->
                    h = new helper
                    h.addPath 'test1'
                    h.addPath 'test2'
                    assert.isArray h.getPath()
                    assert.equal h.pathes.length, 2
                    return
                'Helper:getPath should be equal test1': ->
                    h = new helper
                    h.addPath 'test1'
                    assert.equal h.getPath(0), 'test1'
                    return
                'Helper:getPath should be equal null': ->
                    h = new helper
                    h.addPath 'test1'
                    assert.isNull h.getPath(1)
                    return
                'Helper:setPathes should be function': ->
                    h = new helper
                    assert.isFunction h.setPathes
                    return
                'Helper:setPathes should set one item': ->
                    h = new helper
                    h.setPathes config.path['helper directories']
                    assert.equal h.getPath().length, 1
                    return
                'Helper:initHelpers should be function': ->
                    h = new helper
                    assert.isFunction h.initHelpers
                    return
                'Helper:getHelpers should be function': ->
                    h = new helper
                    assert.isFunction h.getHelpers
                    return
                'Helper:getHelpers set helpers_pathes property who should return array': ->
                    h = new helper
                    h.setPathes config.path['helper directories']
                    h.getHelpers()
                    assert.isArray h.helpers_pathes
                    assert.strictEqual h.helpers_pathes.length > 0, true
                    return
)()
