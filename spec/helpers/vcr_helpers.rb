module VCRHelpers
  def get_weather_forecast_for_jersey_city
    url = "https://api.forecast.io/forecast/#{ENV["FORECAST_IO_KEY"]}/40.721602,-74.04703"
    VCR.use_cassette('forecast_io_forecast_for_jersey_city') do
      return Net::HTTP.get_response(URI(url))
    end
  end
end
