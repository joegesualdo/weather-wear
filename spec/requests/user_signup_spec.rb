require 'rails_helper'

describe 'Signing up' do
  let!(:user){ FactoryGirl.create(:user) }

  context 'with valid email and password' do
    before :each do
      @user_count_before_post = User.count
      post "/api/v1/users", user: {email: "joe@test.com", password: "password"}
      @response_body = response.body
      @json = JSON.parse(@response_body)
    end
    it 'creates a new user record' do
      expect(User.count).to equal @user_count_before_post+1 
    end
    context 'responds with' do
      it '201 (created) status code' do
        expect(response.status).to be 201
      end
      context 'the user object' do
        it 'with an email' do
          expect(@json['email']).to_not be_nil 
        end
        it 'returns authentication token' do
          expect(@json['authentication_token']).to_not be_nil 
        end
      end
    end
  end

  context 'with an email that is already taken' do
    before :each do
      @user_count_before_post = User.count
      post "/api/v1/users", user: {email: user.email, password: "password"}
      @response_body = response.body
      @json = JSON.parse(@response_body)
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
          expect(@json['status']).to_not be_nil 
        end
        it 'with a message key' do
          expect(@json['message']).to_not be_nil 
        end
        context 'with a messages array' do
          it 'exists' do
            expect(@json['messages']).to_not be_nil 
          end
        end
      end
    end
  end
end
