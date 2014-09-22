require 'rails_helper'

describe 'forecast.io Api', vcr: true do
  context 'request to get the forecast for a latitude and longitude' do
    let(:response){get_weather_forecast_for_home}

    context 'response body' do
      it 'returns latitude attribute' do
          json = JSON.parse(response.body)
          expect(json['latitude']).to_not be_nil
      end
    end
  end
end

