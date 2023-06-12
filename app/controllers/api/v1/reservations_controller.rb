class Api::V1::ReservationsController < ApplicationController
  # before_action :authenticate_user!
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  # GET /api/v1/reservations
  def index
    @user = User.find_by_id(params[:user_id])
    @reservations = @user.reservations.all
    render json: { reservations: @reservations }, status: :ok
  end

  # POST /api/v1/reservations
  def create
    @user = User.find_by_id(params[:reservation][:user_id])
    @slot = Slot.find(params[:reservation][:slot_id])

    # Check if the user exists
    unless @user
      render json: { error: 'User not found' }, status: :unprocessable_entity
      return
    end

    # Create a new reservation for the user
    @reservation = @user.reservations.new(
      slot: @slot,
      start_time: params[:reservation][:start_time],
      end_time: params[:reservation][:end_time]
    )

    if @reservation.valid? && @reservation.save

      render json: { reservation: @reservation, message: 'Reservation created successfully' }, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reservations/:id
  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { message: 'Reservation canceled successfully' }, status: :ok
    else
      render json: { error: 'Unable to cancel reservation' }, status: :unprocessable_entity
    end
  end
end
