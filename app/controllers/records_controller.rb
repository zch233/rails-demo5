class RecordsController < ApplicationController
  def create
    render_resource Record.create create_params
  end

  def index
    render_resources Record.all
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

  private

  def create_params
    params.permit(:amount, :category, :sign_time)
  end
end
