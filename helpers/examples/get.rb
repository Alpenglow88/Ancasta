# frozen_string_literal: true

require 'rest-client'
# Description of what the module is/does
module Get
  def method
    RestClient.get 'URL'
  rescue StandardError => e
    e.response
  end
end
