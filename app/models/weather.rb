class Weather
  def initialize(forecast_io_response)
    @forecast_io_response = forecast_io_response
  end
  
  def current_weather
    json = JSON.parse(@forecast_io_response)
    json['currently']['temperature']
  end
end
