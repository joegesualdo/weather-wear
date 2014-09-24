require 'rails_helper'

describe Zipcode do
  # Variables:  -----------------------------------------------------------------------------------------------------
  let!(:zipcode1){ FactoryGirl.create(:zipcode) }
  subject { zipcode1 }

  # Attributes:  -----------------------------------------------------------------------------------------------------
  context 'attributes' do
    it { should respond_to(:zip) }
    it { should respond_to(:city) }
    it { should respond_to(:state) }
    it { should respond_to(:latitude) }
    it { should respond_to(:longitude) }
    it { should respond_to(:timezone_offset) }
    it { should respond_to(:daylight_savings_time) }
  end

  # Validations:  -----------------------------------------------------------------------------------------------------
  context 'validations' do
    it { should validate_presence_of :zip }
    it { should validate_presence_of :city}
    it { should validate_presence_of :state }
    it { should validate_presence_of :latitude}
    it { should validate_presence_of :longitude}
    it { should validate_presence_of :timezone_offset}
    it { should validate_presence_of :daylight_savings_time}
  end

  # Class Methods:  -----------------------------------------------------------------------------------------------------
  context "#find_by_latitude_and_longitude" do
    it 'returns correct zipcode record' do
      zipcode2 = Zipcode.find_by_latitude_and_longitude(40.721602, -74.04703)
      expect(zipcode2.zip).to eq zipcode1.zip
    end
  end
end
