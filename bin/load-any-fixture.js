#!/usr/bin/env node
var args, base_path, e, fixture_file, fixture_name, fixture_path, fs, path, stats;

path = require('path');

fs = require('fs');

base_path = './data/fixtures';

fixture_file = 'fixture.js';

args = process.argv.slice(2);

if (typeof args[0] === 'undefined') {
  console.warn('You must enter an argument.');
} else {
  fixture_name = args[0];
  fixture_path = path.resolve(path.join(base_path, fixture_name));
  try {
    stats = fs.existsSync(path.resolve(this.default_path));
    if (stats === true) {
      require(path.join(fixture_path, fixture_file));
    }
  } catch (_error) {
    e = _error;
    console.warn("The fixture : " + fixture_name + " doesn't exists.");
  }
}
