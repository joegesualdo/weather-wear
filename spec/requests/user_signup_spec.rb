require 'rails_helper'

describe 'Signing up' do
  let!(:user){ FactoryGirl.create(:user) }
  let(:json_body){JSON.parse(response.body)}
  let(:user_count_before_post){User.count}

  context 'with valid email and password' do
    before :each do
      @user_count_before_post = User.count
      post "/api/v1/users", user: {email: "joe@test.com", password: "password"}
    end
    it 'creates a new user record' do
      expect(User.count).to equal @user_count_before_post + 1 
    end
    context 'responds with' do
      it '201 (created) status code' do
        expect(response.status).to be 201
      end
      context 'the user object' do
        it 'with an email' do
          expect(json_body['user']['email']).to_not be_nil 
        end
        it 'returns authentication token' do
          expect(json_body['user']['authentication_token']).to_not be_nil 
        end
      end
    end
  end

  context 'with an email that is already taken' do
    before :each do
      @user_count_before_post = User.count
      post "/api/v1/users", user: {email: user.email, password: "password"}
    end

    it "doesn't create a new user record" do
      expect(User.count).to equal @user_count_before_post
    end
    context 'responds with' do
      it '400 (Bad Request) status code' do
        expect(response.status).to be 400 
      end
      context 'an error object' do
        it 'with a status key' do
          expect(json_body['status']).to_not be_nil 
        end
        it 'with a message key' do
          expect(json_body['message']).to_not be_nil 
        end
      end
    end
  end
end
