class Finance < ApplicationRecord
  # belongs_to :users
  has_one :event
  # belongs_to :event
end
