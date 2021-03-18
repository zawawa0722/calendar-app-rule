class Event < ApplicationRecord
  validates :title, :start_time, :end_time, presence: true
  belongs_to :user
  has_one :finance, dependent: :destroy
  accepts_nested_attributes_for :finance

  def self.search(search)
    if search != ""
      Event.where('title LIKE(?)', "%#{search}%")
    else
      Event.all
    end
  end
end
