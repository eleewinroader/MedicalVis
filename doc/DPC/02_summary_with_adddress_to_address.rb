#!/usr/bin/ruby
# coding: utf-8

# summary_with_addressからaddressのみ抽出する
# 都道府県IDを付与
# また地域情報を付与する
require 'csv'
require 'json'

hospitals = []
prefectures = {}

def change_pref(name)
  if name == "北海道"
    return name
  elsif name == "東京"
    return "東京都"
  elsif ["京都","大阪"].include?(name)
    return name + "府"
  else
    return name + "県"
  end
end


CSV.open("prefecture.csv","r") do |rows|
  rows.each_with_index do |row, i|
    region_id = row[3]
    region_name = row[4]
    name = row[0]
    prefectures[name] = [region_id,region_name, i+1] 
  end 
end

CSV.open("address.csv","w") do |csv|
	CSV.open("summary_with_address.csv","r") do |rows|
		rows.each_with_index do |row,i|
      pref_name = row[14]
      pref_name = change_pref(pref_name)

			csv << [i+1,row[0],row[13],pref_name,row[15].gsub(/電話番号/,''),row[16],row[17], prefectures[pref_name][0], prefectures[pref_name][1],prefectures[pref_name][2]]
	  end
	end
end

