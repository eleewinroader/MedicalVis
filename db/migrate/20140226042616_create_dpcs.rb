class CreateDpcs < ActiveRecord::Migration
  def change
    create_table :dpcs do |t|
      t.references :disease
      t.references :hospital
      t.integer :year
      t.float :hospital_days
      t.integer :patient_count
      t.timestamps
    end
    add_index :dpcs, :disease_id
    add_index :dpcs, :hospital_id
    add_index :dpcs, :year
    add_index :dpcs, [:disease_id, :hospital_id]
    add_index :dpcs, [:disease_id, :year]

    require 'csv'
    data_dir = "#{Rails.root}/doc/DPC"
    CSV.open("#{data_dir}/result_with_address.csv") do |rows|
      rows.each do |row|
        (2007..2012).each_with_index do |year, i|
          position = 13 - i*2
          Dpc.create!({
            disease_id: 1,
            hospital_id: row[0],
            year: year,
            hospital_days: row[position].to_f,
            patient_count: row[position-1]
          })
        end
      end
    end
  end
end
