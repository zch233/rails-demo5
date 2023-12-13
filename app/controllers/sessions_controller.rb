class SessionsController < ApplicationController
  def create
    s = Session.new create_params
    s.validate
    render_resource s
    if s.user
      session[:current_user_id] = s.user.id
    end
  end

  def create_params
    params.permit(:email, :password)
  end
end
