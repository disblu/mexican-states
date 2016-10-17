class CreateNeighborhoods < ActiveRecord::Migration
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :zip_code
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
