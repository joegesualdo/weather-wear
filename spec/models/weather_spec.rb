require 'rails_helper'

describe Weather do
  path = File.join(Rails.root,'spec','fixtures','forecast_io_forecast_for_home_payload.json')
  forecast_io_payload = File.open(path).read

  let(:weather){Weather.new(forecast_io_payload)}

  context '#current_weather' do
    it 'returns the correct value for the temperature key' do
      expect(weather.current_weather).to eq 69.12 
    end
  end
end
