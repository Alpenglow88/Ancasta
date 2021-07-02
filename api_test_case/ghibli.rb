# frozen_string_literal: true

require 'rest-client'
# Example module for hitting Studio Ghible Film and Films api endpoints
module Ghibli
  def hello
    puts hello
  end
  
  def films
    RestClient.get 'https://ghibliapi.herokuapp.com/films'
  rescue StandardError => e
    e.response
  end

  def film
    RestClient.get 'https://ghibliapi.herokuapp.com/films/58611129-2dbc-4a81-a72f-77ddfc1b1b49/'
  rescue StandardError => e
    e.response
  end
end
