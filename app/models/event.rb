class Event < ApplicationRecord
  validates :title, :start_time, :end_time, :body, presence: true
  belongs_to :user
  has_one :finance
  accepts_nested_attributes_for :finance
end
