require 'addressable/uri'
require 'rest-client'

module GameClient

	def game_list
		url = Addressable::URI.new(
		  scheme: 'http',
		  host: 'localhost',
		  port: 3000,
		  path: '/index'
		).to_s

		RestClient.get(url)
	end

	def create_game
		# enter name
		# post request
		# paht: /new
	end

	def enter_game(id)
		# post request
		# post id shown on list (not game id in db)
	end

	def exit_game!
		
	end

	# parse raw json to hash
	def parse_response
		
	end

end