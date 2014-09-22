require 'rails_helper'

describe Weather do
  context '#current_weather' do
    xit 'to return current weather for NY' do
      VCR.use_cassette('forecast.io_home_weather') do
        response = Net::HTTP.get_response(URI('https://api.forecast.io/forecast/7a0a91f695d680e5825e04920ac85cdd/40.7212205,-74.04852590000002'))
        json = JSON.parse(response.body)
        expect(json['latitude']).to equal 40.7212205
      end
    end
  end
end
