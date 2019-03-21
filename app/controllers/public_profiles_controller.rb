class PublicProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @public_profile = PublicProfile.find(params[:id])
    @user = @public_profile.user
    @account = @user.account
    if @account.account_type = 'Freelancer'
      @freelancer = @account.freelancer
    end
    if @account.account_type = 'Recruiter'
      @recruiter = @account.recruiter
    end
  end
end
