class Finance < ApplicationRecord
  belongs_to :user, optional: true
  has_one :event
  
  # has_many :events, through: :event_finances
  
end
