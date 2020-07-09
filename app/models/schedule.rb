class Schedule < ApplicationRecord
  validates :title, presence: true, length: {minimum: 2, maximum: 100}
  # validates :body, presence: true, length: {maximum: 1200}
end
