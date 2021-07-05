class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :show, null: false, foreign_key: {on_delete: :cascade}
      t.references :user, null: false, foreign_key: true
      t.boolean :is_confirm

      t.timestamps
    end
  end
end
