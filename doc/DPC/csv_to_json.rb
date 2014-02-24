#!/usr/bin/ruby
# coding: utf-8
require 'csv'
require 'json'

hospitals = []

CSV.open("result.csv","r") do |rows|
	rows.each do |row|
    hospital = {}
    hospital[:name] = row[0]
    (1..12).each do |i|
      if i.odd?
        row[i] = row[i].to_i
      else
        row[i] = row[i].to_f
      end
    end
    hospital[:hospital_days] = [[2008, row[12]], [2009, row[10]], [2010, row[8]], [2011, row[6]], [2012, row[4]], [2003, row[2]]]
    hospital[:patient_count] = [[2008, row[11]], [2009, row[9]], [2010, row[7]], [2011, row[5]], [2012, row[3]], [2003, row[1]]]
	 hospitals << hospital
  end
end

File.open("hospitals.json","w") do |file|
  file.write JSON.generate(hospitals)
end