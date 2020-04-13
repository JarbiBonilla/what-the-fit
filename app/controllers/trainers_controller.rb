class TrainersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def index
        @trainers = Trainer.all 
    end

    def new
        @trainer = Trainer.new
    end

    def create
        @trainer = Trainer.new(trainer_params)
        if @trainer.save
            session[:trainer_id] = @trainer.id
            redirect_to @trainer
        else
            render :new
        end 
    end

    def show
        @trainer = Trainer.find_by(id: params[:id])
    end

    def edit
        @trainer = Trainer.find(params[:id])
    end

    def update
        @trainer = Trainer.find(params[:id])
        @trainer.update(trainer_params)
      
        if @trainer.save
          redirect_to @trainer
        else
          render :edit
        end
    end

    private

    def trainer_params
        params.require(:trainer).permit(:name, :email, :password, :bio)
    end
end