class EventsController < ApplicationController

    def index
    end

    def new
        @user = current_user
        @event = Event.new
    end

    def create
        @user = current_user
        @event = @user.events.new(event_params)

        if @event.save
            flash[:success] = 'Event created!'
            redirect_to profile_path
        else
            render 'new'
        end
    end


    private 

    def event_params
        params.require('event').permit(:title,:description,:date,:location)
    end
    

end
