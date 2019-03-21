class PanelsController < ApplicationController
  before_action :authenticate_user!


  def index
    @panels = Panel.all
  end

  def show
    @user = current_user
    if @user.registration_status_id >= 3
      @panel = Panel.find(params[:id])
    elsif @user.registration_status_id == 1
      flash[:alert] = "You need to create an account first!"
      redirect_to new_account_path and return
    elsif @user.registration_status_id == 2 && @user.account.account_type == "Freelancer"
      flash[:alert] = "You need to finish your account registration first!"
      redirect_to new_freelancer_path and return
    elsif @user.registration_status_id == 2 && @user.account.account_type == "Recruiter"
      flash[:alert] = "You need to finish your account registration first!"
      redirect_to new_recruiter_path and return
    end
  end
end
