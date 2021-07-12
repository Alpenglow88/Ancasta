# frozen_string_literal: true

require 'json'

# Remove old test spec to enable new one to be built
File.delete('./spec/parameters_spec.rb') if File.exist?('./spec/parameters_spec.rb')

# Build start of new test spec
File.write('./spec/parameters_spec.rb', "# frozen_string_literal: true

    describe('Paramters_Testing') do
      include Bases
      include Functions
    ")

# Iterate over input files and get details test spec file
params_list = File.open('./scripts/data/examples.txt').read.split("\n")

(0..params_list.count - 1).each do |i|
  File.open('./spec/parameters_spec.rb', 'a') do |f2|
    f2.puts "it('Test with Parameters #{i + 1}') do
      puts 'test #{i + 1}'
    url = base1 + \"#{params_list[i]}\"
    url2 = base2 + \"#{params_list[i]}\"

    top_3_check(url, url2)
  end"
  end
end

# Bookend test spec and parameter files for working runs
File.open('./spec/parameters_spec.rb', 'a') do |f2|
  f2.puts "end
      "
end
