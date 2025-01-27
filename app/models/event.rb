class Event < ApplicationRecord
  belongs_to :creator, foreign_key: "user_id", class_name: "User"

  validates :title, :location, :event_date, :details, presence: true
end
