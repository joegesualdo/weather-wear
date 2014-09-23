class CreateZipcodes < ActiveRecord::Migration
  def up 
    create_table :zipcodes do |t|
      t.string :zip
      t.string :city
      t.string :state
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.integer :timezone_offset
      t.boolean :daylight_savings_time
    end
    Zipcode.reset_column_information
    say_with_time "Updating creating zipcodes" do
      Rake::Task["import_zipcodes_csv:create_zipcodes"].invoke
    end
  end
  def down
    drop_table :zipcodes
  end
end
