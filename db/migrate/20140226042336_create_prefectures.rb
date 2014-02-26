class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.references :region
      t.string :name
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :prefectures, :region_id
  end
end
