require 'rails_helper'

describe 'forecast.io Api', vcr: true do

  context 'request to get the forecast for a given latitude and longitude' do
    let(:response){get_weather_forecast_for_jersey_city}

    it 'is successful' do
      expect(response).to_not be_nil
    end

    context 'response body' do
      let(:json_body){JSON.parse(response.body)}

      it 'returns latitude attribute' do
          expect(json_body['latitude']).to_not be_nil
      end

      it 'returns longitude attribute' do
          expect(json_body['longitude']).to_not be_nil
      end
    end
  end
end

