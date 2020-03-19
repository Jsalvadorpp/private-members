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
    end


    private

    def user_params
        params.require('user').permit(:username)
    end

end
