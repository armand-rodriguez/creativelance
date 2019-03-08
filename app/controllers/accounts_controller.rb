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
    if @account.save
      redirect_to @account
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
    params.require(:account).permit(:account_type)
  end

end
