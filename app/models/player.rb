class Player < ApplicationRecord
  validates :name, presence: true
  validates :number, presence: true
  validates :from, presence: true
  validates :height, presence: true
  mount_uploader :img, ImgUploader
end
