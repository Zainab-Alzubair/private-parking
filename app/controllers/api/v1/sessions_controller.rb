class Api::V1::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_authenticity_token, only: :create
  # POST /api/v1/users/sign_in
  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      sign_in(user)
      render json: { auth_token: user.authentication_token, role: user.role, user_id: user.id }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name,:surname, :email, :password])
  end
end
