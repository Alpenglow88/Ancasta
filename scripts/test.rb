# frozen_string_literal: true

# build parameter functions file and initial code
# build test spec file and initial code
# iterate over input list as lines
# take lines and build parameter Functions entries
# take lines and build test spec entries
# insert parameter Functions entries into parameter funcitons File
# insert test spec entries into test spec

require 'json'

# Remove old test spec and parameter files to enable new ones to be built
File.delete('./spec/test_test_spec.rb') if File.exist?('./spec/test_test_spec.rb')
File.delete('./helpers/test_parameters.rb') if File.exist?('./helpers/test_parameters.rb')

# Build start of new test specs adn parameter files
File.write('./spec/test_test_spec.rb', "# frozen_string_literal: true

    describe('Endpoint_Testing') do
      include Bases
      include Functions
      include Parameters
    ")

File.write('./helpers/test_parameters.rb', "# frozen_string_literal: true

    # Parameter values to append to base URLs ##
    module Parameters
        ")

# Iterate over input files and get details for parameters and test spec files
params_list = File.open('./scripts/data/temp.txt').read.split("\n")

(0..params_list.count - 1).each do |i|
  params_entry = "\"#{params_list[i]}\""
  File.open('./helpers/test_parameters.rb', 'a') do |f|
    f.puts "def url_parameters_#{i + 1}
    #{params_entry}
  end"

    File.open('./spec/test_test_spec.rb', 'a') do |f2|
      f2.puts "it('Test with Parameters #{i + 1}') do
      puts 'test #{i + 1}'
    url = base_1 + \"#{params_list[i]}\"
    url2 = base_2 + \"#{params_list[i]}\"

    top_3_check(url, url2)
  end"
    end
  end
end

# Bookend test spec and paremeter files for working runs
File.open('./helpers/test_parameters.rb', 'a') do |f|
  f.puts "end
    "
  File.open('./spec/test_test_spec.rb', 'a') do |f2|
    f2.puts "end
      "
  end
end
