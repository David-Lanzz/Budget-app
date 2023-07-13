class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
  end

  def sign_out_user
    sign_out current_user
    redirect_to root_path
  end
end
