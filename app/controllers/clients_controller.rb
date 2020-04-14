class ClientsController < ApplicationController

    before_action :set_client, only: [:show, :edit, :update]

    def index
        @clients = Client.all
    end

    def new
        @client = Client.new
    end

    def create
        @client = current_user.client.build(client_params)
        if @client.save
            redirect_to clients_path
        else
            render :new
        end 
    end

    def show
       # @client = Client.find_by(id: params[:id])
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
        Client.destroy
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

    def set_client
        @client = Client.find_by(id: params[:id])
    end

end 