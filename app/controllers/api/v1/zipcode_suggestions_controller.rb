module Api
  module V1
    class ZipcodeSuggestionsController< BaseController
      def index
        zipcodes = ZipcodeSuggestion.terms_for(params[:term])
        zipcodes.map! do |zipcode|
          eval(zipcode)
        end
        render json: zipcodes
      end
    end
  end
end
