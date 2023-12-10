class UsersController < ApplicationController
  def create
    u = User.create create_params
    render_resource u
    UserMailer.with(user: u).welcome_email.deliver_later if u.errors.empty?
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end
end
