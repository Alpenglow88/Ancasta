require 'rest-client'

module Ghibli

def films
	begin
		return RestClient.get 'https://ghibliapi.herokuapp.com/films'
	rescue => e
		return e.response
	end
end


def film
	begin
		return RestClient.get 'https://ghibliapi.herokuapp.com/films/58611129-2dbc-4a81-a72f-77ddfc1b1b49/'
	rescue => e
		return e.response
	end
end



end

