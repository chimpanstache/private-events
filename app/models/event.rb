class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_and_belongs_to_many :attendees, class_name: "User", join_table: :attendances

end
