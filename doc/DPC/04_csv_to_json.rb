#!/usr/bin/ruby
# coding: utf-8

# csvデータをd3用のjsonに加工する
require 'csv'
require 'json'

hospitals = []

CSV.open("result_with_address.csv","r") do |rows|
	rows.each do |row|
    hospital = {}
    hospital[:name] = row[1]
    (2..13).each do |i|
      if i.even?
        row[i] = row[i].to_i
      else
        row[i] = row[i].to_f
      end
    end
    hospital[:id] = row[0].to_i
    hospital[:region_id] = row[19].to_i
    hospital[:prefecture_id] = row[21].to_i
    hospital[:hospital_days] = [[2007, row[13]], [2008, row[11]], [2009, row[9]], [2010, row[7]], [2011, row[5]], [2012, row[3]]]
    hospital[:patient_count] = [[2007, row[12]], [2008, row[10]], [2009, row[8]], [2010, row[6]], [2011, row[4]], [2012, row[2]]]
	 hospitals << hospital
  end
end

File.open("hospitals.json","w") do |file|
  file.write JSON.generate(hospitals)
end