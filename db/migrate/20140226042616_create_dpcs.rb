class CreateDpcs < ActiveRecord::Migration
  def change
    create_table :dpcs do |t|
      t.references :disease
      t.references :hospital
      t.integer :year
      t.float :hospital_days
      t.integer :patient_count
      t.timestamps
    end
    add_index :dpcs, :disease_id
    add_index :dpcs, :hospital_id
    add_index :dpcs, :year
    add_index :dpcs, [:disease_id, :hospital_id]
    add_index :dpcs, [:disease_id, :year]
  end
end
