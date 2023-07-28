class AttendedEventsController < ApplicationController
    def create
        @user = User.find(current_user.id)
        @event = Event.find(params[:event_id])

        begin
            @event.attendees << @user
            redirect_to user_path(@user)
        rescue 
            flash[:alert] = 'Unable to save event'
            redirect_back(fallback_location: root_path)
        end
    end
end
