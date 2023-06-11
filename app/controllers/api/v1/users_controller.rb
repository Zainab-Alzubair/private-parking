class Api::V1::UsersController < ApplicationController
  # before_action :authenticate_user!
  # before_action :authorize_admin!, except: [:create]
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
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

  # POST /api/v1/users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

    # POST /api/v1/users/logout
    def logout
      # Perform any necessary logic for logging out
      # Clear session/local storage
      # Handle token revocation
  
      # For example:
      session[:user_id] = nil
      render json: { message: 'Logout successful' }
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
