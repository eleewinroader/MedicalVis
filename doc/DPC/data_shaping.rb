#!/usr/bin/ruby
# coding: utf-8

require 'csv'

result = {}
years = (2008..2013).to_a.reverse.map(&:to_s)
correct_count = years.count * 2

CSV.open("#{years.first}.csv","r:sjis:utf-8") do |rows|
	rows.each do |row|
		name = row[0]
		if (row[1] != '-') && (row[2] != '-')
			result[name] = [row[1],row[2]]
		end
	end
end

years.shift
years.each do |year|
	CSV.open("#{year}.csv","r:sjis:utf-8") do |rows|
		rows.each do |row|
			name = row[0]
			if result[name] && (row[1] != '-') && (row[2] != '-')
				result[name] << row[1]
				result[name] << row[2]
			end
		end
	end
end

CSV.open('result.csv', 'w') do |csv|
	result.each do |hospital, values|
		if values.count == correct_count
			csv << values.unshift(hospital)
		end
	end
end