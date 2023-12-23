require 'custome_error'

class ApplicationController < ActionController::API
  rescue_from CustomError::MustSignInError, with: :render_must_sign_in

  def current_user
    @user_info ||= User.find_by_id session[:current_user_id]
  end
  def render_resource(resource)
    return head 404 if resource.nil?
    if resource.errors.empty?
      render json: { resource: resource }, status: 200
    else
      render json: {errors: resource.errors}, status: 400
    end
  end

  def render_resources(resources)
    render json: {resources: resources}
  end

  def must_sign_in
    if current_user.nil?
      raise CustomError::MustSignInError
    end
  end

  def render_must_sign_in
    render status: :unauthorized
  end
end
