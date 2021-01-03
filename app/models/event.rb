class Event < ApplicationRecord
  validates :title, :start_time, :end_time, :body, presence: true
  belongs_to :user
end
