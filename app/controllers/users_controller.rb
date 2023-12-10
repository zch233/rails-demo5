class UsersController < ApplicationController
  def create
    u = User.create create_params
    UserMailer.with(user: u).welcome_email.deliver_later
    render_resource u
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end
end
