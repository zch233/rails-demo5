class UsersController < ApplicationController
  def create
    u = User.new create_params
    u.save
    render_resource u
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end
end
