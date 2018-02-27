require 'rest-client'

module Post

def post
	begin
		
	return RestClient.post 'URL',  
			{:parameter1 => 'parameter1', :parameter2 => 'parameter2'} 
	rescue => e
		return e.response
	end
end
end


