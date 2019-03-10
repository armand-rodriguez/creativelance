class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :destroy, :edit, :update]
  before_action :authenticate_user!
  def index
    @accounts = Account.all
  end

  def show

  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.update_attributes(user_id: current_user.id)
    byebug
    if @account.save
      @panel = Panel.find_by(user_id: current_user.id)
      @panel.update_attributes(account_id: @account.id)
      redirect_to new_freelancer_path
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
