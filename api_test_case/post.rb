# frozen_string_literal: true

require 'rest-client'
# Description of what the module is/does
module Post
  def post
    RestClient.post 'URL',
                    { parameter1: 'parameter1', parameter2: 'parameter2' }
  rescue StandardError => e
    e.response
  end
end
