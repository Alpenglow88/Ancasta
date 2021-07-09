# frozen_string_literal: true

describe('DemoSpec') do
  include Bases
  include Functions
  include DemoParameters

  it('Top three entries are in sync - THIS SHOULD PASS') do
    url = base1 + films_params
    url2 = base2 + films_params

    top_3_check(url, url2)
  end

  it('Top three entries are out of sync - THIS SHOULD FAIL') do
    url = base1 + films_params
    url2 = base2 + films_params

    array = []

    response1 = JSON.parse(RestClient.get(url))
    response2 = JSON.parse(RestClient.get(url2))

    array.push(response1[0], response1[1], response1[2])

    expect(array).to contain_exactly(response2[6], response2[2], response2[0])
  end
end
