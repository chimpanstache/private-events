class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :event_attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendances, foreign_key: :attended_event_id 

  validates :title, length: { minimum: 5 }, presence: true
  validates :date, presence: true

end
