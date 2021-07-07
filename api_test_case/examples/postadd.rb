# frozen_string_literal: true

require 'rest-client'
# Description of what the module is/does
module PostAdd
  def postadd_method
    file = File.open('temp1.txt', 'r')
    authparam = file.read

    begin
      RestClient.post('URL',
                      { Authorization: authparam })
      { parameter1: 'parameter1', parameter2: 'parameter2', parameter3: 'parameter3', parameter4: 'parameter4' }
    rescue StandardError => e
      e.response
    end
  end
end
