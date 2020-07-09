class Game < ApplicationRecord
  validates :place, presence: true, length: {minimum: 2, maximum: 100}
  validates :title, presence: true, length: {minimum: 2, maximum: 100}
  validates :opponent, presence: true, length: {minimum: 2, maximum: 100}
end
