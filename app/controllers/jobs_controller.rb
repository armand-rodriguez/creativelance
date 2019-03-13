class JobsController < ApplicationController
  before_action :authenticate_user!
  def index
    @jobs = Job.all
  end

  def show
    #you might have to utilize a @newrequest instance variable to get around having two @requesr variables in the same action
    @job = Job.find(params[:id])
    @user = current_user
    @account = @user.account
    @recruiter = @account.recruiter
    @request = Request.new
    @requests = Request.where(job_id: @job.id)
    if @user.account.account_type == 'Freelancer'
      @freelancer = @account.freelancer
      @this_job_request = Request.find_by(job_id: @job.id, freelancer_id: @freelancer.id)
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
    if @job.save

      redirect_to @job
      flash[:notice] = 'Your job has been successfully posted!'
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def job_params
    params.require(:job).permit(:job_title, :job_description, :job_skills, :rate)
  end

end
