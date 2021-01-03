class Event < ApplicationRecord
  validates :title, :starttime, :endtime, :memo, presence: true
  # belongs_to :user
end
