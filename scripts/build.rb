# frozen_string_literal: true

require 'json'

# Remove old test spec and parameter files to enable new ones to be built
File.delete('./spec/parameters_spec.rb') if File.exist?('./spec/parameters_spec.rb')
File.delete('./helpers/parameters.rb') if File.exist?('./helpers/parameters.rb')

# Build start of new test specs adn parameter files
File.write('./spec/parameters_spec.rb', "# frozen_string_literal: true

    describe('Paramters_Testing') do
      include Bases
      include Functions
      include Parameters
    ")

File.write('./helpers/parameters.rb', "# frozen_string_literal: true

    # Parameter values to append to base URLs ##
    module Parameters
        ")

# Iterate over input files and get details for parameters and test spec files
params_list = File.open('./scripts/data/example.txt').read.split("\n")

(0..params_list.count - 1).each do |i|
  params_entry = "\"#{params_list[i]}\""
  File.open('./helpers/parameters.rb', 'a') do |f|
    f.puts "def url_parameters_#{i + 1}
    #{params_entry}
  end"

    File.open('./spec/parameters_spec.rb', 'a') do |f2|
      f2.puts "it('Test with Parameters #{i + 1}') do
      puts 'test #{i + 1}'
    url = base_1 + \"#{params_list[i]}\"
    url2 = base_2 + \"#{params_list[i]}\"

    top_3_check(url, url2)
  end"
    end
  end
end

# Bookend test spec and parameter files for working runs
File.open('./helpers/parameters.rb', 'a') do |f|
  f.puts "end
    "
  File.open('./spec/parameters_spec.rb', 'a') do |f2|
    f2.puts "end
      "
  end
end
