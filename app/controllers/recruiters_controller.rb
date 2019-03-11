class RecruitersController < ApplicationController
  def new
    @user = current_user
    @panel = @user.panel
    @account = @user.account
    @recruiter = Recruiter.new
  end
  def create
    @user = current_user
    @panel = @user.panel
    @account = @user.account

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
