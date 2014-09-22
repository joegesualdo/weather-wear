module VCRHelpers
  def get_weather_forecast_for_home
    url = 'https://api.forecast.io/forecast/7a0a91f695d680e5825e04920ac85cdd/40.7212205,-74.04852590000002'
    VCR.use_cassette('forecast.io_home_weather') do
      return Net::HTTP.get_response(URI(url))
    end
  end
end
