class ForecastIO
  # Retrieve the forecast for a given latitude and longitude.
  #
  # @param latitude [String] Latitude.
  # @param longitude [String] Longitude.
  def self.forecast(latitude,longitude)
    url = URI.parse("https://api.forecast.io/forecast/#{ENV['FORECAST_IO_KEY']}/#{latitude},#{longitude}")
    response = Net::HTTP.get_response(URI(url.to_s))
    response_body = response.body
    response_body.to_s
  end
end
