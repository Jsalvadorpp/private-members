class EventsController < ApplicationController

    def index
        @events = Event.all.order("created_at DESC")
    end

    def new
        @user = current_user
        @event = Event.new
    end

    def show
        @event = Event.find_by(id: params['id'])
    end

    def create
        @user = current_user
        @event = @user.events.new(event_params)
        invitation = Invitation.new(attended_event: @event,attendee: @user)

        if @event.save
            invitation.save
            flash[:success] = 'Event created!'
            redirect_to profile_path
        else
            render 'new'
        end
    end

    def new_invitation
        @event = Event.find_by(id: params['event_id'])
        invitation = Invitation.new(attended_event: @event,attendee: current_user)
        if  invitation.save 
            flash[:success] = 'you are going to the event'
            redirect_to user_event_path(@event.creator.id,@event.id)
        end
    end

    def remove_invitation
        @event = Event.find_by(id: params['event_id'])
        Invitation.find_by(attended_event: @event,attendee: current_user).destroy
        flash[:success] = 'you remove the invitation to the event'
        redirect_to user_event_path(@event.creator.id,@event.id)
    end


    private 

    def event_params
        params.require('event').permit(:title,:description,:date,:location)
    end
    

end
