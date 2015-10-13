'use strict'

# ---
# ---
# ---

itr = (object, callback) -> (callback key, value, object) for own key, value of object

# ---

val = (old_value, new_value) -> switch typeof old_value
	when 'number' then parseInt new_value
	
	# ---
	
	when 'boolean' then switch new_value.toLowerCase().trim()
		when 'true' then true
		when 'false' then false
		
		# ---
		
		else `new_value ? true : false`
		
	# ---
	
	else new_value
	
# ---

map = (object, prefix='') -> itr object, (key, value, object) ->
	return map value, prefix + key + '_' if value isnt null and typeof value is 'object'
	
	# ---
	
	env_key = prefix + key
	
	# ---
	
	env_key = env_key.replace /([A-Z]+)/g, '_$1'
	env_key = env_key.replace /\W+/g, '_'
	env_key = env_key.replace /_+/g, '_'
	
	# ---
	
	env_key = env_key.toUpperCase()
	
	# ---
	
	object[key] = val value, process.env[env_key] if process.env[env_key]?
	
# ---

module.exports = map

# ---
