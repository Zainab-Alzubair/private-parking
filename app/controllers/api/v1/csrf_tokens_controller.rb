class Api::V1::CsrfTokensController < ApplicationController
  protect_from_forgery with: :null_session
  def show
    render json: { csrfToken: form_authenticity_token }, status: :ok
  end
end
