require 'rails_helper'

describe Weather do
  context '#current_weather' do
    it 'to return current weather for NY' do
      weather = Weather.current_weather
      expect(weather).to equal 10
    end
  end
end
