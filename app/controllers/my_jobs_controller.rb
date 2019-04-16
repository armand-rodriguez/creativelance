class MyJobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    if @user.is_recruiter?
      @jobs = Job.where(user_id: @user.id)
    elsif @user.is_freelancer?

      @jobs = Job.joins(:requests).where(requests: { freelancer_id: @user.account.freelancer.id })
    end
  end
end
