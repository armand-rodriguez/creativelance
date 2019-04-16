class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @accounts = Account.all
  end

  def show

  end

  def new
    @user = current_user
    @panel = @user.panel
    if @user.registration_status_id == 2 && @user.account.account_type == "Freelancer"
      flash[:alert] = "You have already created an account!"
      redirect_to new_freelancer_path and return
    elsif @user.registration_status_id == 2 && @user.account.account_type == "Recruiter"
      flash[:alert] = "You have already created an account!"
      redirect_to new_recruiter_path and return
    elsif @user.registration_status_id >= 3
      flash[:alert] = "You have already created an account!"
      redirect_to @panel and return
    end
    @account = Account.new
  end

  def create
    @user = current_user
    @panel = @user.panel
    if @user.registration_status_id == 2 && @user.account.account_type == "Freelancer"
      flash[:alert] = "You have already created an account!"
      redirect_to new_freelancer_path and return
    elsif @user.registration_status_id == 2 && @user.account.account_type == "Recruiter"
      flash[:alert] = "You have already created an account!"
      redirect_to new_recruiter_path and return
    elsif @user.registration_status_id >= 3
      flash[:alert] = "You have already created an account!"
      redirect_to @panel and return
    end
    @account = Account.new(account_params)
    @account.update_attributes(user_id: current_user.id)
    if @account.save
      @panel = Panel.find_by(user_id: current_user.id)
      @panel.update_attributes(account_id: @account.id)
      @user.update_attributes(registration_status_id: 2)
      if @account.account_type == 'Freelancer'
        @user.update_attributes(is_freelancer: true)
        redirect_to new_freelancer_path
      end
      if @account.account_type == 'Recruiter'
        @user.update_attributes(is_recruiter: true)
        redirect_to new_recruiter_path
      end
    else
      render 'new'
    end
  end

  def destroy

  end

  def edit

  end

  def update

  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:account_type, :registration_status_id)
  end

end
