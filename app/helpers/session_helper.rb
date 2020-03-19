module SessionHelper

    def log_in(user)
        session['user_id'] = user.id
    end

    def current_user
        @user = @user || User.find_by(id: session[:user_id]) if is_logged?
    end

    def is_logged?
        #if there's no session , then check cookies
        if session['user_id'].nil?
            if cookies.signed['user_id']
                
                user = User.find_by(id: cookies.signed['user_id'])
                if user && user.authenticate_token(cookies['remember_token'])
                    log_in(user)
                end     
            end
        #session exists
        else
            return true
        end
    end

    def remember_session(user)
        user.generate_token
        cookies.permanent['remember_token'] = user.remember_token
        cookies.permanent.signed['user_id'] = user.id
    end

    def forget_session(user)
        cookies.delete('remember_token')
        cookies.delete('user_id')
        user.forget_token()
    end
end
