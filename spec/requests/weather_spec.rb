require 'rails_helper'

describe 'Weather endpoint' do
  let(:user){create(:user)}
  xit 'is not available if user is not signed in' do
    post "/api/v1/users", user: {email: "test@test.com", password: "password"}
  end
end
