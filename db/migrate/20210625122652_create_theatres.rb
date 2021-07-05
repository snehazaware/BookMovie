class CreateTheatres < ActiveRecord::Migration[6.1]
  def change
    create_table :theatres do |t|
      t.string :name
      t.integer :screens
      t.integer :pincode
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
