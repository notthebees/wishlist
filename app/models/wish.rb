class Wish < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
end
