require 'rails_helper'

describe 'User' do
  let!(:user){ FactoryGirl.create(:user) }

  context "can view users" do
    it 'with authenticity token in heder' do
      get "/api/v1/users", nil, {"X-AUTH-TOKEN" =>user.authentication_token}
      expect(response.status).to be 200 
    end
    it 'with authenticity token in uri' do
      get "/api/v1/users?auth_token=#{user.authentication_token}"
      expect(response.status).to be 200 
    end
  end

end
