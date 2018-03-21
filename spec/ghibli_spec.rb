require 'ghibli_helper'

###########
##Modules##
###########

include Ghibli


##################
##Test procedure##
##################

begin


## runs module tests
	describe('<Get Films>') do
	  it('/<Get Films should return a 200>') do
		response = Ghibli.films
		log = JSON.parse(response) 

## checks for API response code and writes passing json response to file
	if
		response.code == (200)
		File.open("filmList.json", 'a') {|f| f.write('TEST <Film_List>') }
		File.open("filmList.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		puts "<Film List>"
		puts JSON.pretty_generate(log)

## takes failing response and writes failing json response to file	
	else
		File.open("failFilmList.json", 'a') {|f| f.write("TEST <Film_List>") }
		File.open("failFilmList.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		expect(response.code).to be (200)
	
	end  
end	
end
end