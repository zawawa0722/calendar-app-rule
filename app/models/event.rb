class Event < ApplicationRecord
  validates :title, :start_time, :end_time, presence: true
  belongs_to :user
  has_one :finance, dependent: :destroy
  accepts_nested_attributes_for :finance
end
