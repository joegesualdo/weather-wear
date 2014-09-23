class ForecastIO
  def self.forecast(lat,long)
    url = URI.parse("https://api.forecast.io/forecast/#{ENV['FORECAST_IO_KEY']}/#{lat},#{long}")
    response = Net::HTTP.get_response(URI(url.to_s))
    response_body = response.body
    response_body.to_s
  end
end
