class PrivacyController < ApplicationController
  def index
    binding.byebug
    sign_out :user
    render json: current_user
  end
end
