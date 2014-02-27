#!/usr/bin/ruby
# coding: utf-8

# addressとresultを結合する
require 'csv'
require 'json'

hospitals = {}

CSV.open("result.csv","r") do |rows|
	rows.each do |row|
		hospitals[row[0]] = row
	end
end

CSV.open("address.csv","r") do |rows|
	rows.each do |row|
		hospitals[row[0]] << row[2]
		hospitals[row[0]] << row[3]
		hospitals[row[0]] << row[4]
		hospitals[row[0]] << row[5]
		hospitals[row[0]] << row[6]
		hospitals[row[0]] << row[7]
		hospitals[row[0]] << row[8]
		hospitals[row[0]] << row[9]
	end
end

CSV.open("result_with_address.csv","w") do |csv|
	hospitals.values.each do |value|
		csv << value
	end
end