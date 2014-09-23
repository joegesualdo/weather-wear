require 'rails_helper'

describe 'Weather lookup' do
  before :each do
    VCR.insert_cassette('forecast_io_forecast_for_home')
  end
  after :each do
    VCR.eject_cassette('forecast_io_forecast_for_home')
  end
  let!(:zipcode){ FactoryGirl.create(:zipcode)}
  context 'for zipcode' do
    it 'returns successfully' do
      get '/api/v1/weather/07758'
      expect(response.status).to eq 200
    end
    context 'responds with' do
      it '' do
        get '/api/v1/weather/07758'
        response_body = response.body
        json = JSON.parse(response_body)
        expect(json['data']['current_temperature']).to_not be_nil
      end
    end
  end
end
