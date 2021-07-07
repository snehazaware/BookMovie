class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  has_many :bookings
  validates :screen_id, :movie_id, :date, :time, :amount, presence: true
end
