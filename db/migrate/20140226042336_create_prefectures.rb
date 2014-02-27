class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.references :region
      t.string :name
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :prefectures, :region_id

    require 'csv'
    data_dir = "#{Rails.root}/doc/DPC"
    CSV.open("#{data_dir}/prefecture.csv") do |rows|
      rows.each do |row|
        Prefecture.create!({
          name: row[0],
          latitude: row[1].to_f,
          longitude: row[2].to_f,
          region_id: row[3]
        })
      end
    end
  end
end
