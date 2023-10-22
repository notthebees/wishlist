class Wish < ApplicationRecord
  validates :title, presence: true
end
