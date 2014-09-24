require 'rails_helper'

describe Weather do
  # Fakes:  -----------------------------------------------------------------------------------------------------
  path = File.join(Rails.root,'spec','fixtures','forecast_io_forecast_for_home_payload.txt')
  fake_forecast_io_payload = File.open(path).read

  # Variables:  -----------------------------------------------------------------------------------------------------
  let(:weather){Weather.new(fake_forecast_io_payload)}
  subject { weather }

  # Class methods:  -----------------------------------------------------------------------------------------------------
  context '#current_temperature' do
    it 'returns the correct value for the temperature key' do
      expect(weather.current_temperature).to eq 69.12 
    end
  end
end
