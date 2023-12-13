class UsersController < ApplicationController
  def create
    # s = User.new create_params
    # s.save
    # 等价于 User.create
    render_resource User.create create_params
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end

  def me
    render_resource current_user
  end
end
