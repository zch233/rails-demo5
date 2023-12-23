class RecordsController < ApplicationController

  before_action :must_sign_in
  def create
    render_resource Record.create create_params
  end

  def index
    render_resources Record.page(params[:page])
  end

  def show
    if params[:id]
      render_resource Record.find_by_id params[:id]
    end
  end

  def destroy
    if params[:id]
      render_resource Record.destroy params[:id]
    end
  end

  def update
    if params[:id]
      render_resource Record.update params[:id], create_params
    end
  end

  private

  def create_params
    params.permit(:amount, :category, :sign_time)
  end
end
