require 'rails_helper'

describe 'Signing in' do
  let!(:user){ FactoryGirl.create(:user) }
  let(:json_body){JSON.parse(response.body)}

  context 'with valid email and password' do
    before :each do
      post "/api/v1/sign_in", {email: user.email, password: 'password'}
    end
    context "responds with" do

      it 'authentication token' do
        expect(json_body['auth_token']).to eq user.authentication_token
       end
    end
  end

  context 'with an email that doesn\'t exist' do
    before :each do
      post "/api/v1/sign_in", {email: 'nonexistentemail', password: "password"}
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

    context 'doesnt responds with' do

      it 'auth_token' do
        expect(json_body['authentication_token']).to be_nil 
      end
    end
  end
end
