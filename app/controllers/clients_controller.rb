class ClientsController < ApplicationController

    def index
        @clients = Client.all
    end

    def new
        @client = Client.new
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

    def client_params
        params.require(:clients).permit(:name, 
        :age,
        :height,
        :initial_weight,
        :phone_number,
        :email,
        :gender,
        :current_weight,
        :goal_weight)
    end

end 