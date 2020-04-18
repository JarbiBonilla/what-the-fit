class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :verified_user
    helper_method :current_user, :logged_in?

    private


    def verified_user
        redirect_to '/' unless logged_in?
    end
    
    def logged_in?
        !!current_user
    end
    
    def current_user
        Trainer.find_by(id: session[:trainer_id])
    end
    
end
