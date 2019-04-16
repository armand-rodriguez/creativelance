class JobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @jobs = Job.all.order("created_at DESC")
  end

  def show
    #you might have to utilize a @newrequest instance variable to get around having two @requesr variables in the same action
    @job = Job.find(params[:id])
    @user = current_user
    @account = @user.account

    @request = Request.new
    @requests = Request.where(job_id: @job.id)
    @job_room = @job.job_room
    if @user.is_freelancer?
      @freelancer = @account.freelancer
      @this_job_request = Request.find_by(job_id: @job.id, freelancer_id: @freelancer.id)
    end
    if @user.is_recruiter?
      @recruiter = @account.recruiter
      if @job.recruiter_id == @recruiter.id
        @job_panel = @job.job_panel
      end
    end

  end

  def new
    @user = current_user
    @account = @user.account
    @panel = @user.panel
    if @account.account_type != 'Recruiter'
      flash[:alert] = "Only recruiters are allowed to create job posts!"
      redirect_to @panel and return
    end
    @job = Job.new
  end

  def create
    @user = current_user
    @account = @user.account
    @panel = @user.panel
    if @account.account_type != 'Recruiter'
      flash[:notice] = "Only recruiters are allowed to create job posts!"
      redirect_to @panel and return
    end
    @recruiter = @account.recruiter
    @job = Job.new(job_params)
    @job.update_attributes(recruiter_id: @recruiter.id)
    @job.update_attributes(user_id: @user.id)
    if @job.save
      JobPanel.create!(job_id: @job.id, user_id: @user.id)
      JobRoom.create!(job_id: @job.id, user_id: @user.id, authorization_code: SecureRandom.uuid)
      redirect_to @job
      flash[:notice] = 'Your job has been successfully posted!'
    else
      render 'new'
    end
  end

  def close
    @job = Job.find(params[:id])
    if @job.job_status_id == 2
      redirect_to @job and return
    end
    @job.update_attributes(job_status_id: 2)
    flash[:notice] = "You have closed this position to new applicants."
    redirect_to @job
  end

  def open
    @job = Job.find(params[:id])
    if @job.job_status_id == 1
      redirect_to @job and return
    end
    @job.update_attributes(job_status_id: 1)
    flash[:notice] = "You have reopened this position to new applicants."
    redirect_to @job
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def job_params
    #you have an empty migration waiting for its private attr
    params.require(:job).permit(:job_title, :job_description, :job_skills, :position, :rate)
  end

end
