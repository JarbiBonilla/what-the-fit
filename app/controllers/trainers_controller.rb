class TrainersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]
    before_action :set_trainer, only: [:show, :edit, :update]
    
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
        if current_user.id == @trainer.id 
            render :show
        else
            redirect_to trainer_path(current_user)
        end
    end

    def edit
        
    end

    def update
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

    def set_trainer
        @trainer = Trainer.find_by(id: params[:id])
    end
end