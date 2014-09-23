module Api
  module V1
    class WeatherController < BaseController
      def show
        @zipcode = Zipcode.find_by(zip: params[:zipcode])
        @latitude = @zipcode.latitude
        @longitude= @zipcode.longitude
        @forecast_io_response = ForecastIO.forecast(@latitude, @longitude)
        @weather = Weather.new(@forecast_io_response)

        data = { 
          data:{
            current_temperature: @weather.current_temperature
          }
        }
        render json: data 
      end
    end
  end
end
