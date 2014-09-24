require 'rails_helper'

describe User do
  let!(:user){ FactoryGirl.create(:user)}
  subject { user}

  # Attributes:  -----------------------------------------------------------------------------------------------------
  context 'attributes' do
    it { should respond_to(:zipcode) }
    it { should respond_to(:email) }
  end

  # Validations:  -----------------------------------------------------------------------------------------------------
  context 'validations' do
    it { should validate_presence_of :email}
    it { should validate_presence_of :password}
  end
end
