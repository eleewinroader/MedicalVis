class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.references :prefecture
      t.string :name
      t.string :postcode
      t.string :address
      t.string :phone
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :hospitals, :prefecture_id

    require 'csv'
    data_dir = "#{Rails.root}/doc/DPC"
    CSV.open("#{data_dir}/result_with_address.csv") do |rows|
      rows.each do |row|
        Hospital.create!({
          prefecture_id: row[21],
          name: row[1],
          postcode: row[14],
          address: row[16],
          latitude: row[17].to_f,
          longitude: row[18].to_f
        })
      end
    end
  end
end
