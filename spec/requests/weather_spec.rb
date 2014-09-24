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
    before do
      get '/api/v1/weather/07758'
      @response_body = response.body
      @json = JSON.parse(@response_body)
    end
    it 'returns successfully' do
      expect(response.status).to eq 200
    end
    context 'responds with' do
      it 'status' do
        expect(@json['status']).to_not be_nil
      end
      context 'data object with' do
        it 'current temperature' do
          expect(@json['data']['current_temperature']).to_not be_nil
        end
        it 'city' do
          expect(@json['data']['city']).to_not be_nil
        end
        it 'state' do
          expect(@json['data']['state']).to_not be_nil
        end
        it 'zipcode' do
          expect(@json['data']['zipcode']).to_not be_nil
        end
      end
    end
  end
end
