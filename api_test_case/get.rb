require 'rest-client'

module Get

def get
	begin
		return RestClient.get 'URL'
	rescue => e
		return e.response
	end
end
end