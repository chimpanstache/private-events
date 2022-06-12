class Event < ApplicationRecord
  belongs_to :creator, class_name: "User"
  validates :title, length: { minimum: 5 }, presence: true
  validates :date, presence: true

end
