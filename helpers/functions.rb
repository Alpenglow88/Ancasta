# frozen_string_literal: true

# Helper functions #
module Functions
  # This function will take the top 3 indexed entries from 2 API repsonse objects and match them against each other
  # regardless of ordering
  def top_3_check(url1, url2)
    array = []

    response1 = JSON.parse(RestClient.get(url1))
    response2 = JSON.parse(RestClient.get(url2))

    array.push(response1[0], response1[1], response1[2])
    expect(array).to contain_exactly(response2[1], response2[2], response2[0])
  end
end
