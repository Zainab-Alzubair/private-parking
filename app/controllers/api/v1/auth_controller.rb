module Api
  module V1
    class AuthController < ApplicationController
      def validate_token
        if current_user
          render json: { valid: true, role: current_user.role }
        else
          render json: { valid: false }
        end
      end
    end
  end
end