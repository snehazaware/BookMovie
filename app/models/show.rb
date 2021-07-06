class Show < ApplicationRecord
  belongs_to :movie
  belongs_to :screen
  has_many :bookings
  validates :screen_id, presence: { message: "field can't be empty" }
  validates :movie_id, presence: { message: "field can't be empty" }
  validates :date, presence: { message: "field can't be empty" }
  validates :time, presence: { message: "field can't be empty" }
  validates :amount, presence: { message: "field can't be empty" }
end
