class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_user!

  # GET /api/v1/reservations
  def index
    @reservations = current_user.reservations
    render json: { reservations: @reservations }, status: :ok
  end

  # POST /api/v1/reservations
  def create
    @slot = Slot.find(params[:slot_id])
    # Check if the slot is available for reservation
    unless @slot.is_available?
      render json: { error: 'Slot is not available for reservation' }, status: :unprocessable_entity
      return
    end

    # Check if the user already has a reservation for the same date and time
    if current_user.reservations.exists?(date: params[:date], time: @slot.time)
      render json: { error: 'You already have a reservation for this date and time' }, status: :unprocessable_entity
      return
    end

    # Create a new reservation for the user
    @reservation = current_user.reservations.new(slot: @slot, date: params[:date], time: @slot.time)

    if @reservation.save
      # Update slot availability status
      @slot.update(is_available: false)

      render json: { reservation: @reservation, message: 'Reservation created successfully' }, status: :created
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reservations/:id
  def destroy
    @reservation = current_user.reservations.find(params[:id])
    @slot = @reservation.slot

    if @reservation.destroy
      # Update slot availability status
      @slot.update(is_available: true)

      render json: { message: 'Reservation canceled successfully' }, status: :ok
    else
      render json: { error: 'Unable to cancel reservation' }, status: :unprocessable_entity
    end
  end
end
