class ClientsController < ApplicationController
    
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        #byebug
        if current_user.id == params[:trainer_id].to_i
            @clients = current_user.clients
            render :index 
        else
            redirect_to trainer_clients_path(current_user)
        end 
    end

    def new
        @client = Client.new
        @client.appointments.build
    end

    def create
        @client = current_user.clients.build(client_params)
       # if @client.save
       #byebug
            @appointment = @client.appointments.build
            current_user.clients << @client 
            @appointment.save
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
            flash[:message] = "Your client's information has been updated successfully!"
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
        :goal_weight, appointments_attributes: [:appointment_time,
        :paid_for,
        :price,
        :client_id, :trainer_id])
    end

    def set_client
        @client = Client.find_by(id: params[:id])
    end

end 