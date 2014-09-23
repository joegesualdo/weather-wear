require 'rails_helper'

describe Zipcode do
  let!(:zipcode1){ FactoryGirl.create(:zipcode) }
  context "#find_by_latitude_and_longitude" do
    it 'returns correct zipcode record' do
      zipcode2 = Zipcode.find_by_latitude_and_longitude(40.427561, -74.1069)
      expect(zipcode2.zip).to eq zipcode1.zip
    end
  end
end
