module VCRHelpers
  def get_weather_forecast_for_home
    url = "https://api.forecast.io/forecast/#{ENV["FORECAST_IO_KEY"]}/40.7212205,-74.04852590000002"
    VCR.use_cassette('forecast.io_home_weather') do
      return Net::HTTP.get_response(URI(url))
    end
  end
end
