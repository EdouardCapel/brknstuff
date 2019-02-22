class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :owner, through: :item, source: :user
  validates :start_date, :end_date, presence: true
end
