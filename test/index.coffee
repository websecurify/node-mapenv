'use strict'

# ---
# ---
# ---

mapenv = require '../src/index'

# ---
# ---
# ---

@t01 = (test) ->
	o = {a: 1}
	
	mapenv o
	
	# ---
	
	test.ok o.a is 1
	
	# ---
	
	test.done()
	
# ---

# TODO: requires more tests

# ---
