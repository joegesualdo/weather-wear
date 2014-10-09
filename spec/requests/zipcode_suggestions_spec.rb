require 'rails_helper'

describe "Zipcode Suggestions" do
  let(:json_body){ JSON.parse(response.body) }

  context "GET /api/v1/zipcode_suggestions/07" do
    before :each do
      get "/api/v1/zipcode_suggestions/07"
    end
    context "successful request" do
      it "responds with 'city_suggestions' key" do
        expect(json_body['zipcode_suggestions']).to_not be_nil 
      end
      it "each suggestion has a 'zipcode' key" do
        expect(json_body['zipcode_suggestions'][0]['zipcode']).to_not be_nil 
      end
      it "each suggestion has a 'city' key" do
        expect(json_body['zipcode_suggestions'][0]['city']).to_not be_nil 
      end
      it "returns a maximum of 10 results if result set is > 10" do
        expect(json_body['zipcode_suggestions'].length).to equal 10 
      end
      it "responds with 200 status code" do
        expect(response.status).to be 200
      end
    end
  end
end
