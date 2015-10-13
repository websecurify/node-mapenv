(function() {
  'use strict';
  var itr, map, val,
    hasProp = {}.hasOwnProperty;

  itr = function(object, callback) {
    var key, results, value;
    results = [];
    for (key in object) {
      if (!hasProp.call(object, key)) continue;
      value = object[key];
      results.push(callback(key, value, object));
    }
    return results;
  };

  val = function(old_value, new_value) {
    switch (typeof old_value) {
      case 'number':
        return parseInt(new_value);
      case 'boolean':
        switch (new_value.toLowerCase().trim()) {
          case 'true':
            return true;
          case 'false':
            return false;
          default:
            return new_value ? true : false;
        }
        break;
      default:
        return new_value;
    }
  };

  map = function(object, prefix) {
    if (prefix == null) {
      prefix = '';
    }
    return itr(object, function(key, value, object) {
      var env_key;
      if (value !== null && typeof value === 'object') {
        return map(value, prefix + key + '_');
      }
      env_key = prefix + key;
      env_key = env_key.replace(/([A-Z]+)/g, '_$1');
      env_key = env_key.replace(/\W+/g, '_');
      env_key = env_key.replace(/_+/g, '_');
      env_key = env_key.toUpperCase();
      if (process.env[env_key] != null) {
        return object[key] = val(value, process.env[env_key]);
      }
    });
  };

  module.exports = map;

}).call(this);
