class PanelsController < ApplicationController

  def show
    @user = current_user
    @panel = Panel.find(params[:id])
  end
end
