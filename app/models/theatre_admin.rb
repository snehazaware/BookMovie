class TheatreAdmin < ApplicationRecord
  belongs_to :theatre
  belongs_to :user
  validates :theatre, :user, presence: true
end
