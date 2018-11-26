class AppointmentsController < ApplicationController
  before_action :set_doctor

  def index
    @date = @doctor.appointments
  end

  def new
    @appointment = @doctor.appointments.new
  end

  def create
    @appointment = @doctor.appointments.new(appointment_params)
    if @appointment.save
      redirect_to doctor_appointments_path
    else
      render :new
    end
  end

  def destroy
    appointment = @doctor.appointments.find(params[appointment_params])
    appointment.destroy
    redirect_to doctor_users_path
  end
  
  private
  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :user_id)
  end
end
