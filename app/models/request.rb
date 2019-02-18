class Request < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :owner, through: :item, source: :user
end
