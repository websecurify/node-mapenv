'use strict'

# ---
# ---
# ---

module.exports = (grunt) ->
	grunt.initConfig
		coffee: compile:
			files: [
				expand: true, cwd: 'src/', src: '*.coffee', dest: 'lib/', ext: '.js'
			]
			
		nodeunit: test: ['test/*.coffee']
		
	# ---
	
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-nodeunit'
	
	# ---
	
	grunt.registerTask 'compile', ['coffee:compile']
	grunt.registerTask 'test', ['nodeunit:test']
	
	# ---
	
	grunt.registerTask 'build', ['test', 'compile']
	
	# ---
	
	grunt.registerTask 'default', ['build']
	
# ---
