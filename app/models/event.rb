class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'

    has_many :attended_events, dependent: :destroy
    has_many :attendees, through: :attended_events, source: :user
end
