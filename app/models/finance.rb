class Finance < ApplicationRecord
  belongs_to :user, optional: true
  has_one :event
end
