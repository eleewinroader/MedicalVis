# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

data_dir = "#{Rails.root}/doc/DPC"

CSV.open("#{data_dir}/disease.csv") do |rows|
  rows.each do |row|
    Disease.create!({name: row[0]})
  end
end

CSV.open("#{data_dir}/region.csv") do |rows|
  rows.each do |row|
    Region.create!({name: row[0]})
  end
end

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

CSV.open("#{data_dir}/result_with_address.csv") do |rows|
  rows.each do |row|
    Hospital.create!({
      prefecture_id: row[19],
      name: row[1],
      postcode: row[14],
      address: row[16],
      latitude: row[17].to_f,
      longitude: row[18].to_f
    })
  end
end

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

