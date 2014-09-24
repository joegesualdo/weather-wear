module Api
  module V1
    class WeatherController < BaseController
      # Callbacks:  -------------------------------------------------------------------------------------------------------
      before_action :auth_only!

      # Actions:  -------------------------------------------------------------------------------------------------------
      def show
        zipcode   = Zipcode.find_by(zip: params[:zipcode])
        forecast_io_response = ForecastIO.forecast(zipcode.latitude, zipcode.longitude)
        claritin_response = Claritin.forecast(zipcode.zip)
        weather   = Weather.new(forecast_io_response, claritin_response)

        formatted_response = format_response(zipcode, weather)

        render json: formatted_response
      end

      # Private: Methods  -------------------------------------------------------------------------------------------------------
      private

      # Private: Formats a weather response 
      #
      # zipcode  - a Zipcode instance.
      # weather - a Weather instance 
      #
      # Examples
      #
      #   multiplex('Tom', 4)
      #   # => 'TomTomTomTom'
      #
      # Returns formatted hash for a response
      def format_response(zipcode, weather)
        data = { 
          status: 200,
          data:{
            current_temperature: weather.current_temperature,
            city: zipcode.city,
            state: zipcode.state,
            zipcode: zipcode.zip,
            pollen: weather.current_pollen
          }
        }
        data
      end
    end
  end
end
