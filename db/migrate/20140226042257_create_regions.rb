class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :name
      t.timestamps
    end

    require 'csv'
    data_dir = "#{Rails.root}/doc/DPC"
    CSV.open("#{data_dir}/region.csv") do |rows|
      rows.each do |row|
        Region.create!({name: row[0]})
      end
    end
  end
end
