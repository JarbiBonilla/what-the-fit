class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :home]

    def home

    end

    def new
    end

    def create
      if request.env['omniauth.auth']
        trainer = Trainer.create_with_omniauth(request.env['omniauth.auth'])
        session[:trainer_id] = trainer.id    
        redirect_to trainer_path(trainer.id)
      elsif 
        trainer = Trainer.find_by(email: params[:trainer][:email])
        trainer && trainer.authenticate(params[:trainer][:password])
        session[:trainer_id] = trainer.id
        redirect_to trainer_path(trainer)
      else
        flash[:message] = "Invalid Email and/or Password, please try again."
        redirect_to "/login"
      end

    end

    def destroy
      session.clear
      redirect_to '/'
    end
end