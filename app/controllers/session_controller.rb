class SessionController < ApplicationController

    def login
    end
    
    def create

        user = User.find_by(username: params['session']['username'])

        if user 
            log_in(user)
            flash['success'] = 'Successfully Logged In!'
            redirect_to home_path
        else
            flash.now['danger'] = 'user not registered'
            render 'login'
        end
    end

    def logout 
        session['user_id'] = nil
        flash['success'] = 'Successfully Logged Out!'
        redirect_to home_path
    end


end
