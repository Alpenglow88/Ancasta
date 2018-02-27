require 'spec_helper'

###########
##Modules##
###########

include Post

include Get


puts 'DEAE ANCASTAE GEMINVS MANI VSLM' 


##################
##Test procedure##
##################

begin

## <Get> 
	describe('<Get>') do
	  it('/<status should return a 200>') do
		response = Status.status
		log = JSON.parse(response) 
	if
		response.code == (200)
		File.open("tempfile1.json", 'a') {|f| f.write('TEST <Get>') }
		File.open("tempfile1.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		puts "<Get>"
		puts JSON.pretty_generate(log)
	else
		File.open("failtempfile1.json", 'a') {|f| f.write("TEST <Get>") }
		File.open("failtempfile1.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		expect(response.code).to be (200)
	
	end  
end	


## <Post>

	 describe('Loginok') do
		it('POST /loginok should return a 200') do
		response = Loginok.loginok
		log = JSON.parse(response) 
	if
		response.code == (200)
		File.open("AlphaLogMC.json", 'a') {|f| f.write('TEST Login OK') }
		File.open("AlphaLogMC.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		puts "LoginOK"
		puts JSON.pretty_generate(log)
		securityToken = JSON.parse(response.body) ['response']['body']['securityToken']
		File.open("ST.txt", 'a') {|f| f.write(securityToken) }		
	else
		File.open("FailLogAlphaMC.json", 'a') {|f| f.write("TEST Login OK") }
		File.open("FailLogAlphaMC.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		expect(response.code).to be (200)
	
	end
	## <PostAdd>

	 describe('Loginok') do
		it('POST /loginok should return a 200') do
		response = Loginok.loginok
		log = JSON.parse(response) 
	if
		response.code == (200)
		File.open("AlphaLogMC.json", 'a') {|f| f.write('TEST Login OK') }
		File.open("AlphaLogMC.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		puts "LoginOK"
		puts JSON.pretty_generate(log)
		securityToken = JSON.parse(response.body) ['response']['body']['securityToken']
		File.open("ST.txt", 'a') {|f| f.write(securityToken) }		
	else
		File.open("FailLogAlphaMC.json", 'a') {|f| f.write("TEST Login OK") }
		File.open("FailLogAlphaMC.json", 'a') {|f| f.write(JSON.pretty_generate(log)) }
		expect(response.code).to be (200)
	
	end    
end	 
end
end
end
