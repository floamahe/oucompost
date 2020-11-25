class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    authorize @appointment
    @garden = Garden.find(params[:garden_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @garden = Garden.find(params[:garden_id])
    @appointment.garden = @garden
    @appointment.user = current_user
    authorize @appointment
    if @appointment.save
      redirect_to dashboard_path
    else
      render :new
      flash[:notice] = "Warning, your appointment didn't go through, please review the form."
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :quantity, :description)
  end
end
