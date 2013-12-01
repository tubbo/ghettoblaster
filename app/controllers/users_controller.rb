
# A simple JSON API for reading Users

class UsersController < ApplicationController
  respond_to :json

  before_filter :authenticate_user!

  def index
    @users = User.where searchable_params

    respond_with @users
  end

  def show
    @user = User.find params[:id]
    halt status: 404 unless @user.present?

    respond_with @user
  end

  private
  def searchable_params
    params.permit :email, :created_at, :last_sign_in_at
  end
end
