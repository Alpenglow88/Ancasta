

require 'rest-client'

module Ghibli

def films
	begin
		return RestClient.get 'https://ghibliapi.herokuapp.com/films'
	rescue => e
		return e.response
	end
end
end
