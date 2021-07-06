class Screen < ApplicationRecord
  belongs_to :theatre
  has_many :shows, dependent: :destroy
  validates :name, presence: { message: "field can't be empty" },uniqueness: { message: " must be unique"}
  validates :seats, numericality: { message: "feild can't be empty" }
end
