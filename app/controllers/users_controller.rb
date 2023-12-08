class UsersController < ApplicationController
  def create
    u = User.new
    u.email = params[:email]
    u.password = params[:password]
    if u.save
      render json: u, status: 200
    else
      render json:u.errors, status: 400
    end
  end
end
