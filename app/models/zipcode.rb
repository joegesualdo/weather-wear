class Zipcode < ActiveRecord::Base
   def self.find_by_latitude_and_longitude(latitude, longitude)
     find_by(latitude: latitude, longitude: longitude)
   end
end
