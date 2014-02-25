#!/usr/bin/ruby
# coding: utf-8

# 各年のCSVから病院名が変化していない、かつ全年のデータが存在するものを抽出する

require 'csv'

result = {}
years = (2007..2012).to_a.reverse.map(&:to_s)
correct_count = years.count * 2 + 1
id = 0

CSV.open("#{years.first}.csv","r:sjis:utf-8") do |rows|
	rows.each do |row|
		name = row[0]
		if (row[1] != '-') && (row[2] != '-')
			result[name] = [name, row[1],row[2]]
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
			id += 1
			csv << values.unshift(id)
		end
	end
end