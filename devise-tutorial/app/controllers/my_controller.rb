class MyController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: current_user
  end

  def destroy
    binding.byebug
    sign_out :user
    redirect_to root_path
  end
end
