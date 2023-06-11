class Api::V1::SlotsController < ApplicationController
  # before_action :authenticate_user!
  # before_action :check_admin_role, except: [:index, :show]
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  # GET /api/v1/slots
  def index
    @slots = Slot.all
    render json: { slots: @slots }, status: :ok
  end

  # GET /api/v1/slots/:id
  def show
    @slot = Slot.find(params[:id])
    render json: { slot: @slot }, status: :ok
  end

  # POST /api/v1/slots
  def create
    @slot = Slot.new(slot_params)
    if @slot.save
      render json: { slot: @slot, message: 'Slot created successfully' }, status: :created
    else
      render json: { errors: @slot.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /api/v1/slots/:id
  def update
    @slot = Slot.find(params[:id])
    if @slot.update(slot_params)
      render json: { slot: @slot, message: 'Slot updated successfully' }, status: :ok
    else
      render json: { errors: @slot.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/slots/:id
  def destroy
    @slot = Slot.find(params[:id])
    @slot.destroy
    render json: { message: 'Slot deleted successfully' }, status: :no_content
  end

  private

  def slot_params
    params.require(:slot).permit(:time, :car_type, :price, :is_disabled, :is_available, :is_cancelled, :cancelation_policy, :availability_start_time, :availability_end_time)
  end
  
  
  def check_admin_role
    unless current_user.admin?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end