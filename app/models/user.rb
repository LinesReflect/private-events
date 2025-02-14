class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: "user_id", class_name: "Event"
  has_many :event_attendees
  has_many :attended_events, through: :event_attendees, source: :event
  has_many :event_invites
  has_many :invites, through: :event_invites, source: :event

  def possesive_user
    self.username.last == "s" ? self.username + "s'" : self.username + "'s"
  end
end
