class Screen < ApplicationRecord
  belongs_to :theatre
  has_many :shows, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :seats, presence: true
end
