class Weather
  # contructor take a json string from forecast.io
  def initialize(forecast_io_response, claritin_response = nil)
    @claritin_response = claritin_response 
    @forecast_io_response = forecast_io_response
  end
  
  def current_temperature
    json = JSON.parse(@forecast_io_response)
    json['currently']['temperature']
  end

  def current_pollen
    return if @claritin_response.nil?
    json = JSON.parse(@claritin_response)
    json['pollenForecast']['forecast'][0]
  end
end
