class ApplicationController < ActionController::API
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
end
