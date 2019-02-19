class Item < ApplicationRecord
  belongs_to :user
  has_many :renters, through: :request, source: :user
  has_many :requests

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :level, presence: true
end
