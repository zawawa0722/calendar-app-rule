class Finance < ApplicationRecord
  belongs_to :event, :user
end
