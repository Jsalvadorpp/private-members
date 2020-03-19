module SessionHelper

    def log_in(user)
        session['user_id'] = user.id
    end

    def current_user
        @user = @user || User.find_by(id: session[:user_id]) if is_logged?
    end

    def is_logged?
        !session['user_id'].nil?
    end
end
