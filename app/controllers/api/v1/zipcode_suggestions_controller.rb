module Api
  module V1
    class ZipcodeSuggestionsController< BaseController
      def index
        render json: ZipcodeSuggestion.terms_for(params[:term])
      end
    end
  end
end
