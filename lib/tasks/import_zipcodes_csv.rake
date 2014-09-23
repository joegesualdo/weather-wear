# This rake task will take a the csv with zipcode and create
# a record in 'zipcodes' table for each

require 'csv'

namespace :import_zipcodes_csv do
  task :create_zipcodes => :environment do
    # get the path to the zipcodes csv file
    zipcode_csv_file = File.join(Rails.root, 'lib', 'assets', 'zipcode.csv')
    # get the contents from the csv file
    csv_text = File.read(zipcode_csv_file)
    # parse the csv 
    csv = CSV.parse(csv_text, :headers => true)
    # Loop through all the zipcode and create a Zipcode record for each
    csv.each do |row|
      zipcode = Zipcode.create!(row.to_hash)
      if zipcode
        puts "#{zipcode.zip} created!"
      end
    end
  end
end 

