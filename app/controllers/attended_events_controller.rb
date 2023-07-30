class AttendedEventsController < ApplicationController
    def create
        @user = User.find(current_user.id)
        @event = Event.find(params[:event_id])

        begin
            @event.attendees << @user
        rescue 
            flash[:alert] = 'Unable to save event'
        end
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @user = User.find(current_user.id)
        @event = Event.find(params[:id])

        @event.attendees.delete(@user)
        redirect_back(fallback_location: root_path)
    end
end
