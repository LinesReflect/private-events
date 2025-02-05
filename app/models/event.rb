class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :event_attendees
  has_many :attendees, through: :event_attendees,  source: :user

  validates :title, :location, :event_date, :details, presence: true
end
