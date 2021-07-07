class Booking < ApplicationRecord
  belongs_to :show
  belongs_to :user
  validates :show, :user, :seat_number, :amount, :is_confirm, presence: true
end
