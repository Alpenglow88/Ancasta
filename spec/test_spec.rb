# frozen_string_literal: true

describe('Endpoint_Testing') do
  include Bases
  include Parameters

  it('Top three entries are in sync - THIS SHOULD PASS') do
    url = ghibli_base + films_params
    array1 = []

    response1 = JSON.parse(RestClient.get(url))
    response2 = JSON.parse(RestClient.get(ghibli_base + films_params))

    array1.push(response1[0], response1[1], response1[2])

    expect(array1).to contain_exactly(response2[1], response2[2], response2[0])
  end

  it('Top three entries are out of sync - THIS SHOULD FAIL') do
    url = ghibli_base + films_params
    array1 = []

    response1 = JSON.parse(RestClient.get(url))
    response2 = JSON.parse(RestClient.get(ghibli_base + films_params))

    array1.push(response1[0], response1[1], response1[2])

    expect(array1).to contain_exactly(response2[6], response2[2], response2[0])
  end
end
