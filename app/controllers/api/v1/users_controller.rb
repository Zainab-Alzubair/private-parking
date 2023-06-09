class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  # GET /api/v1/users
  def index
    @users = User.all
    render json: @users
  end

  # GET /api/v1/users/:id
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # PUT /api/v1/users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :role)
  end

  def authorize_admin!
    unless current_user.admin?
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
