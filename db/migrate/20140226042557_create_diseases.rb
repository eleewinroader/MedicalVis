class CreateDiseases < ActiveRecord::Migration
  def change
    create_table :diseases do |t|
      t.string :name
      t.timestamps
    end

    require 'csv'
    data_dir = "#{Rails.root}/doc/DPC"
    CSV.open("#{data_dir}/disease.csv") do |rows|
      rows.each do |row|
        Disease.create!({name: row[0]})
      end
    end
  end
end
