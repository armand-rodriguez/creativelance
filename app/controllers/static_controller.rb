class StaticController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @panel = Panel.find_by(user_id: current_user.id)
      if @user.account && @user.freelancer
        redirect_to @panel and return
      end
      if @user.account && @user.recruiter
        redirect_to @panel and return
      end
      if !@user.account && @user
        redirect_to new_account_path and return
      end
      if @user.account && !@user.account.freelancer && @user.account.account_type == 'Freelancer'
        redirect_to new_freelancer_path and return
      end
      if @user.account && !@user.account.recruiter && @user.account.account_type == 'Recruiter'
        redirect_to new_recruiter_path and return
      end
    end
  end
  def contact

  end
end
