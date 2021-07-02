# frozen_string_literal: true

require 'example_spec_helper'

##################
# #Test procedure##
##################

## <Get> example

## runs module tests
describe('<Get>') do
  include Get
  it('/<GET should return a 200>') do
    response = Get.get
    log = JSON.parse(response)

    ## checks for API response code and writes passing json response to file
    if response.code == (200)
      File.open('tempGet.json', 'a') { |f| f.write('TEST <Get>') }
      File.open('tempGet.json', 'a') { |f| f.write(JSON.pretty_generate(log)) }
      puts '<Get>'
      puts JSON.pretty_generate(log)

    ## takes failing response and writes failing json response to file
    else
      File.open('failTempGet.json', 'a') { |f| f.write('TEST <Get>') }
      File.open('failTempGet.json', 'a') { |f| f.write(JSON.pretty_generate(log)) }
      expect(response.code).to be(200)

    end
  end

  ## <Post> example

  ## runs module tests
  describe('<Post>') do
    include Post
    it('/<POST should return a 200>') do
      response = Post.post
      log = JSON.parse(response)

      ## checks for API response code and writes passing json response to file
      if response.code == (200)
        File.open('tempPost.json', 'a') { |f| f.write('TEST <Post>') }
        File.open('tempPost.json', 'a') { |f| f.write(JSON.pretty_generate(log)) }
        puts '<Post>'
        puts JSON.pretty_generate(log)

        ## finds specified parameter in json response [nested] and writes to file
        parameter = JSON.parse(response.body) ['response']['body']['<parameter>']
        File.open('tempParameter.txt', 'a') { |f| f.write(parameter) }

      ## takes failing response and writes failing json response to file
      else
        File.open('failTempPost.json', 'a') { |f| f.write('<Post>') }
        File.open('failTempPost.json', 'a') { |f| f.write(JSON.pretty_generate(log)) }
        expect(response.code).to be(200)

      end
    end

    ## <PostAdd> example

    ## runs module tests
    describe('<PostAdd>') do
      include PostAdd
      it('/POSTADD should return a 200') do
        response = PostAdd.postadd
        log = JSON.parse(response)

        ## checks for API response code and writes passing json response to file
        if response.code == (200)
          File.open('tempPostAdd.json', 'a') { |f| f.write('TEST Login OK') }
          File.open('tempPostAdd.json', 'a') { |f| f.write(JSON.pretty_generate(log)) }
          puts '<PostAdd>'
          puts JSON.pretty_generate(log)

          ## finds specified parameter in json response [nested] and writes to file
          parameter = JSON.parse(response.body) ['response']['body']['<parameter>']
          File.open('tempParameter.txt', 'a') { |f| f.write(parameter) }

        ## takes failing response and writes failing json response to file
        else
          File.open('failTempPostAdd.json', 'a') { |f| f.write('TEST Login OK') }
          File.open('failTempPostAdd.json', 'a') { |f| f.write(JSON.pretty_generate(log)) }
          expect(response.code).to be(200)

        end
      end
    end
  end
end
