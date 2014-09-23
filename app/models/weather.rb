class Weather
  # contructor take a json string from forecast.io
  def initialize(forecast_io_response)
    @forecast_io_response = forecast_io_response
  end
  
  def current_temperature
    json = JSON.parse(@forecast_io_response)
    json['currently']['temperature']
  end
end
