class AppointmentsController < ApplicationController

    before_action :set_appointment, only: [:show, :edit, :update, :destroy]

    def index
        @appointments = Appointment.all 
    end

    def new
        if params[:client_id] && @client = Client.find_by(id: params[:client_id])
            @appointment = @client.appointments.build
        else
            flash[:message] = "Client does not exist! Cannot create appointment."
            redirect_to new_client_path
        end 
    end

    def create
        @appointment = current_user.appointments.build(appointment_params)
        if @appointment.save
            flash[:message] = "Appointment has been successfully created!"
            redirect_to appointment_path(@appointment)
        else
            #@client = @appointment.client
            render :new
        end 
    end

    def show

    end

    def edit

    end

    def update
        if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
        else 
            render :edit 
        end
    end

    def destroy
        @appointment.destroy
        flash[:message] = "Your appointment has been successfully deleted!"
        redirect_to trainer_path(current_user)
    end

    private

    def appointment_params
        params.require(:appointment).permit(
            :appointment_time,
            :paid_for,
            :price,
            :client_id, :id
        )
    end

    def set_appointment
        @appointment = Appointment.find_by(id: params[:id])
    end

end