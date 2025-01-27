class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: "user_id", class_name: "Event"

  def possesive_user
    self.username.last == "s" ? self.username + "s'" : self.username + "'s"
  end
end
