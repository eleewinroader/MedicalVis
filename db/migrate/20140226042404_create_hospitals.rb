class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.references :prefecture
      t.string :name
      t.string :postcode
      t.string :address
      t.string :phone
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
    add_index :hospitals, :prefecture_id
  end
end
