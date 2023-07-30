class AttendedEventsController < ApplicationController
    def new
        @attended_event = AttendedEvent.new
        @event_id = params[:event]
    end
    
    def create
        @user = User.find(params[:attended_event][:user_id])
        @event = Event.find(params[:attended_event][:event_id])

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
