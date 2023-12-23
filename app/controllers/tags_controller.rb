class TagsController < ApplicationController
  before_action :must_sign_in

  def index
    render_resources Tag.page params[:page]
  end

  def show
    if params[:id]
      render_resource Tag.find_by_id params[:id]
    end
  end

  def create
    render_resource Tag.create create_params
  end

  def update
    if params[:id]
      render_resource Tag.update params[:id], create_params
    end
  end

  def destroy
    if params[:id]
      render_resource Tag.destroy params[:id]
    end
  end

  def create_params
    params.permit :name, :icon
  end
end
