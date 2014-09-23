module VCRHelpers
  def get_weather_forecast_for_home
    url = "https://api.forecast.io/forecast/#{ENV["FORECAST_IO_KEY"]}/40.427561,-74.1069"
    VCR.use_cassette('forecast_io_forecast_for_home') do
      return Net::HTTP.get_response(URI(url))
    end
  end
end
