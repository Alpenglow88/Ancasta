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
		puts "Get film list failed - see log for response"
		File.open("failFilmList.json", 'a') {|f| f.write("TEST <Film_List>") }
		File.open("failFilmList.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		expect(response.code).to be (200)
	
	end
end




## runs module tests
	describe('<Get Totoro>') do
	  it('/<Get Totoro should return a 200>') do
		response = Ghibli.film
		log = JSON.parse(response) 

	if
		response.code == (200)
		File.open("totoro.json", 'a') {|f| f.write('TEST Totoro Description') }
		File.open("totoro.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }

		totoroDescription = JSON.parse(response.body)['description']
		File.open("totoroDescription.json", 'a') {|f| f.write(totoroDescription) }

		puts "<Totoro Description>"
		puts JSON.pretty_generate(log)

	else
		puts "Get film list failed - see log for response"
		File.open("failFilmList.json", 'a') {|f| f.write("TEST <Film_List>") }
		File.open("failFilmList.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		expect(response.code).to be (200)
	
	end



end	
end
end
end