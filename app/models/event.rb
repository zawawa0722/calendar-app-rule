class Event < ApplicationRecord
  validates :title, :start_time, :end_time, presence: true
  belongs_to :user
  has_one :finance
  # has_many :finance, through: :event_finances
  # belongs_to :finance
  accepts_nested_attributes_for :finance
end
