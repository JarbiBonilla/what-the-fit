class TrainersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new

    end

    def create

    end

    def show

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def trainer_params
        params.require(:trainer).permit(:name, :email, :password, :bio)
    end



end