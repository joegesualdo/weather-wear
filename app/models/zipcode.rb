# == Schema Information
#
# Table name: zipcodes
#
#  id                    :integer          not null, primary key
#  zip                   :string(255)
#  city                  :string(255)
#  state                 :string(255)
#  latitude              :decimal(9, 6)
#  longitude             :decimal(9, 6)
#  timezone_offset       :integer
#  daylight_savings_time :boolean
#

class Zipcode < ActiveRecord::Base

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates :zip,
            :city,
            :state,
            :latitude,
            :longitude,
            :timezone_offset,
            :daylight_savings_time,
            presence: true

  # Public: Class Methods:  -----------------------------------------------------------------------------------------------------
  
  # Public: get the zipcode record from the database by latitude and longitude 
  # 
  # latitude - An Integer latitude value
  # longitude - An Integer longitude value
  # 
  # Examples
  # 
  #   Zipcode.find_by_latitude_and_longitude(43.005895,-71.013202)
  #   # => "#<Zipcode:0x007ffb99ae3c28>"
  # 
  # Returns the zipcode instance that has the latitude and longitude provided
   def self.find_by_latitude_and_longitude(latitude, longitude)
     find_by(latitude: latitude, longitude: longitude)
   end
end
