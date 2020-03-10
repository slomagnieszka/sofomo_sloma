class CreateGeolocations < ActiveRecord::Migration[6.0]
  def change
    create_table :geolocations do |t|
      t.string :ip, null: false
      t.string :ip_type, null: false
      t.string :continent_code
      t.string :continent_name
      t.string :country_code
      t.string :country_name
      t.string :region_code
      t.string :region_name
      t.string :city
      t.string :zip
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.integer :geoname_id
      t.string :capital
      t.boolean :is_eu

      t.timestamps
    end
  end
end
