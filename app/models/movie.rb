class Movie < ApplicationRecord
  has_many :shows
  has_one_attached :image
  scope :search, ->(name) { where(name: name) }
  validates :name, :description, :release_date, :language, :category, :runtime, presence: true
end
