class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
      @trainer = Trainer.new
    end

    def create
      trainer = Trainer.find_by(email: params[:trainer][:email])
      if trainer && trainer.authenticate(params[:trainer][:password])
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