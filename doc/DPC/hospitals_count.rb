# coding: utf-8

require 'csv'

["2013","2012","2011","2010","2009","2008"].each do |year|
	eval "@h_#{year} = []"

	CSV.open("#{year}.csv","r:sjis:utf-8") do |rows|
		rows.each do |row|
			name = row[0]
			if (row[1] != '-') && (row[2] != '-')
				eval("@h_#{year} << name")
			end
		end
	end
end