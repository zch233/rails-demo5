class UsersController < ApplicationController
  def create
    u = User.new create_params
    u.save
    render_resource u
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end

  def render_resource(resource)
    if resource.valid?
      render json: resource, status: 200
    else
      render json: resource.errors, status: 400
    end
  end
end
