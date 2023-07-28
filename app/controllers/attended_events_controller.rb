class AttendedEventsController < ApplicationController
    def create
        @user = User.find(current_user.id)
        @event = Event.find(params[:event_id])

        @event.attendees << @user
    end
end
