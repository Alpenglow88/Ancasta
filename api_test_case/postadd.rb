require 'rest-client'

module PostAdd

def postadd
	file = File.open("temp1.txt", "r")
	<authparam> = file.read
	 
 begin
   RestClient.post('URL',
		{:Authorization => authparam})
		{:parameter1 => 'parameter1', :parameter2 => 'parameter2', :parameter3 => 'parameter3', :parameter4 => 'parameter4'},
  rescue => e
  return e.response
 end
 end
 
end
