class EventsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    
    def index
        @events = Event.all
    end

    def show
       @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @user = User.find(current_user.id)
        @event = Event.new(event_params)
        @event.creator = @user

        if @event.save
            redirect_to user_path(@user)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @user = User.find(current_user.id)
        @event = Event.find(params[:id])

        if @event.update(event_params)
            redirect_to user_path(@user)
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(current_user.id)
        @event = Event.find(params[:id])

        @event.destroy
        
        redirect_to user_path(@user)
    end

    private

    def event_params
        params.require(:event).permit(:title, :body, :date, :private)
    end
end
