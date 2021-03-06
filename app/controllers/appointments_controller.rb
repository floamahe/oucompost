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
    compute_score(@appointment)
    if @appointment.save
      redirect_to dashboard_path
    else
      render :new
      flash[:notice] = "Warning, your appointment didn't go through, please review the form."
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def update
    @appointment = Appointment.find(params[:id])
    authorize @appointment

    if @appointment.update(appointment_params)
      compute_score(@appointment)
      redirect_to dashboard_path
    else
      render :edit
      flash[:notice] = "Warning, your appointment didn't go through, please review the form."
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @garden = @appointment.garden
    @appointment.user = current_user
    @appointment.destroy
    redirect_to dashboard_path
  end

  def accept
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.status = "accepted"
    @appointment.save
    redirect_to dashboard_path
  end

  def refuse
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.status = "refused"
    @appointment.save
    redirect_to dashboard_path
  end

  def deliver
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.delivered = true
    @appointment.save
    redirect_to dashboard_path
  end

  def canceldeliver
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.delivered = false
    @appointment.save
    redirect_to dashboard_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :quantity, :description, :score)
  end

  def compute_score(appointment)
    points = 0
    if appointment.description.downcase == "organic waste"
      points = 1
    elsif appointment.description.downcase == "compost"
      points = 3
    end
    appointment.score = appointment.quantity * points
    appointment.save
  end
end
