class City < ApplicationRecord
  has_many :theatres
  scope :show, ->(name) { where(name: name)}
end
