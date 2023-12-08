class UsersController < ApplicationController
  def create
    u = User.create create_params
    render_resource u
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end
end
