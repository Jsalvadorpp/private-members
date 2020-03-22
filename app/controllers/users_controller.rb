class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save()
            flash[:success] = 'you are now registered!'
            redirect_to home_path
        else
            render 'new'
        end 
    end

    def profile
        @user = current_user
        @events_created_by_user = @user.events.order("created_at DESC")

        
        @attending_events = Event.joins(:invitations).where("invitations.attendee_id = #{@user.id}")
    end


    private

    def user_params
        params.require('user').permit(:username)
    end

end
