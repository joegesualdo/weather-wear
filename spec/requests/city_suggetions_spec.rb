require 'rails_helper'

describe "City Suggestions" do
  context "GET /api/v1/city_suggestions/way" do
    before :each do
      get "/api/v1/city_suggestions/way"
      @json = JSON.parse(response.body)
    end
    context "successful request" do
      it "responds with 'city_suggestions' key" do
        expect(@json['city_suggestions']).to_not be_nil 
      end
      it "only return 10 results if result set is > 10" do
        expect(@json['city_suggestions'].length).to equal 10 
      end
      it "responds with 200 status code" do
        expect(response.status).to be 200
      end
    end
  end
end
