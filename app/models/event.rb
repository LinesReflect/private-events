class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "user_id", class_name: "User"
  has_many :event_attendees
  has_many :attendees, through: :event_attendees,  source: :user
  has_many :event_invites
  has_many :invited, through: :event_invites, source: :user

  validates :title, :location, :event_date, :details, presence: true

  scope :past, -> { where("event_date < ?", DateTime.current.beginning_of_day) }
  scope :today, -> { where(event_date: [ DateTime.current.beginning_of_day, DateTime.current.end_of_day ]) }
  scope :upcoming, -> { where("event_date > ?", DateTime.current.end_of_day) }

  scope :private_events, -> { where(is_private: true) }
end
