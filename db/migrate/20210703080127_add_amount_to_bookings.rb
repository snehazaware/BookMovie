class AddAmountToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :amount, :integer
  end
end
