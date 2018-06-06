class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :appointment, :through => :user

  before_action :set_user

  def index
    @appointments = Appointment.future_appointments(@user.id)
    respond_to do |response|
      response.html {render :index}
      response.json {render json: @appointments}
    end
  end

  def new
    @appointment = @user.appointments.build
    @rabbi = Rabbi.new
  end

  def create
    @appointment = @user.appointments.build(appointment_params)
    if @appointment.save
        redirect_to user_appointment_path(@user, @appointment)
    else
      render :new
    end

  end

  def show
    @appointment = @user.appointments.find(params[:id])
  end

  def edit
    @appointment = @user.appointments.find(params[:id])
  end

  def update
    @appointment = Appointment.find_by(id: params[:id])


    if @appointment.update(appointment_params)
      redirect_to user_appointment_path(@user, @appointment)
    else
      render "edit"
    end

  end

  def destroy
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy

    redirect_to user_appointments_path(@user)


  end


  private

  def appointment_params
    params.require(:appointment).permit(:rabbi_id, :service_id, :time_and_date, :time, :date, rabbi_attributes: [:first_name, :last_name])
  end


  def set_user
    @user = User.find_by(id: params[:user_id])
  end


end
