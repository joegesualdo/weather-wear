module Api
  module V1
    class CitySuggestionsController< BaseController
      def index
        render json: CitySuggestion.terms_for(params[:term])
      end
    end
  end
end
