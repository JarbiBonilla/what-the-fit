class ClientsController < ApplicationController
    
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients = Client.all 
    end

    def new
        @client = Client.new
    end

    def create
        @client = current_user.clients.build(client_params)
        if @client.save
            redirect_to client_path(@client)
        else
            render :new
        end 
    end

    def show
       # @client = Client.find_by(id: params[:id])
       #binding.pry
    end

    def edit
       # @client = Client.find_by(id: params[:id])
    end

    def update
        if @client.update(client_params)
            redirect_to client_path(@client)
        else 
            render :edit 
        end
    end

    def destroy
        @client.destroy
        flash[:message] = "Client successfully deleted!"
        redirect_to trainer_clients_path(current_user)
    end

    private 

    def client_params
        params.require(:client).permit(:name, 
        :age,
        :height,
        :initial_weight,
        :phone_number,
        :email,
        :gender,
        :current_weight,
        :goal_weight)
    end

    def set_client
        @client = Client.find_by(id: params[:id])
    end

end 