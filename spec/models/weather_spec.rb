require 'rails_helper'

describe Weather do
  # Fakes:  -----------------------------------------------------------------------------------------------------
  path = File.join(Rails.root,'spec','fixtures','forecast_io_forecast_for_home_payload.txt')
  fake_forecast_io_payload = File.open(path).read

  path = File.join(Rails.root,'spec','fixtures','claritin_forecast_for_jersey_city_payload.txt')
  fake_claritin_payload = File.open(path).read

  context 'initialized with forecastIO payload and claritin payload' do

    # Variables:  -----------------------------------------------------------------------------------------------------
    let(:weather){Weather.new(fake_forecast_io_payload, fake_claritin_payload )}
    subject { weather }

    # Instance methods:  -----------------------------------------------------------------------------------------------------
    context '.current_temperature' do
      it 'returns the correct value for the temperature key' do
        expect(weather.current_temperature).to eq 69.12 
      end
    end

    context '.current_pollen' do
      it 'returns the correct value for the pollen key' do
        expect(weather.current_pollen).to eq 2.8 
      end
    end
  end
end
