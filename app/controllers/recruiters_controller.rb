class RecruitersController < ApplicationController
  def new
    @user = current_user
    @panel = @user.panel
    if @user.registration_status_id == 1
      flash[:alert] = "You need to create an account type first!"
      redirect_to new_account_path and return
    end
    if @user.account
      @account = @user.account

      if @user.registration_status_id >= 3
        flash[:alert] = "You have already created an account!"
        redirect_to @panel and return
      end
      if @account.account_type == "Freelancer"
        flash[:alert] = "You have created a recruiter account and are unable to create a freelancer account with this user!"
        redirect_to new_freelancer_path and return
      end
      @recruiter = Recruiter.new
    end
  end
  def create

    @user = current_user
    @panel = @user.panel
    @account = @user.account
    if @user.registration_status_id >= 3
      flash[:alert] = "You have already created an account!"
      redirect_to @panel and return
    end
    if @account.account_type == "Freelancer"
      flash[:alert] = "You have created a freelancer account and are unable to create a recruiter account with this user!"
      redirect_to new_freelancer_path and return
    end
    @recruiter = Recruiter.new(recruiter_params)
    @recruiter.update_attributes(account_id: @account.id, user_id: @user.id, panel_id: @panel.id)
    if @recruiter.save
      @user.update_attributes(registration_status_id: 3)
      flash[:notice] = "You recruiter profile was successfully created!"
      redirect_to @panel
    else
      render 'new'
    end
  end

  private

  def recruiter_params
    params.require(:recruiter).permit(:first_name, :last_name, :company, :company_description, :resume)
  end
end
