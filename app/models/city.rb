class City < ApplicationRecord
  has_many :theatres
  scope :show, ->(name) { where(name: name)}
  validates :name, :state,  presence: true
end
