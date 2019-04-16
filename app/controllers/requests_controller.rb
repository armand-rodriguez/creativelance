class RequestsController < ApplicationController
  before_action :authenticate_user! 
  def create
    @user = current_user
    @account = @user.account
    @panel = @user.panel
    @freelancer = @account.freelancer
    @job = Job.find(params[:job_id])
    if @job.job_status_id === 2
      flash[:alert] = 'This job has been closed to new requests.'
      redirect_to jobs_path and return
    end
    if @user.current_active_jobs_count == 0
      flash[:notice] = 'You are currently active in 4 jobs and cannot make new requests until you have either finished those jobs!'
      redirect_to jobs_path and return
    end
    @recruiter_user = @job.user
    @request = @job.requests.build(request_params)
    @request.update_attributes(freelancer_id: @freelancer.id, job_id: @job.id, recruiter_user_id: @user.id)
    if @request.save
      flash[:notice] = "Your job request has been sent successfully!"
      redirect_to @job
    else
      flash[:alert] = "Something has gone wrong with your request!"
      redirect_to @job
    end
  end

  # def destroy
  #
  # end

  def edit
    @job = Job.find(params[:job_id])
    @job_panel = @job.job_panel
    @job_room = @job.job_room
    @request = @job.requests.find(params[:id])
    @request.update_attributes(request_status_id: 2)
    user_authorization_code = @job_room.authorization_code
    # If user has already accepted 4 jobs
    if @request.freelancer.user.current_active_jobs_count === 0
      flash[:alert] = 'This user has accepted 4 jobs and cannot accept any more!'
      redirect_to @job_panel and return
    end

    if @request.freelancer.user.authorization_code == nil
      @request.freelancer.user.update_attributes(authorization_code: user_authorization_code)
    elsif @request.freelancer.user.second_authorization_code == nil
      @request.freelancer.user.update_attributes(second_authorization_code: user_authorization_code)
    elsif @request.freelancer.user.third_user_authorization_code == nil
      @request.freelancer.user.update_attributes(third_authorization_code: user_authorization_code)
    elsif @request.freelancer.user.fourth_user_authorization_code == nil
      @request.freelancer.user.update_attributes(fourth_authorization_code: user_authorization_code)
    end

    @request.freelancer.user.decrement!(:current_active_jobs_count)


    redirect_to @job_panel
    flash[:notice] = "You have accepted the #{@request.freelancer.first_name.titleize} #{@request.freelancer.last_name.titleize}'s request!"
  end

  def reject_request
    @job = Job.find(params[:job_id])
    @job_panel = @job.job_panel
    @job_room = @job.job_room
    @request = @job.requests.find(params[:id])
    @request.update_attributes(request_status_id: 3)
    user_authorization_code = @job_room.authorization_code
    if @request.freelancer.user.authorization_code == nil
      redirect_to @job_panel and return
      flash[:notice] = "You have rejected the #{@request.freelancer.first_name.titleize} #{@request.freelancer.last_name.titleize}'s request!"
    elsif @request.freelancer.user.authorization_code == user_authorization_code
      @request.freelancer.user.update_attributes(authorization_code: nil)
      redirect_to @job_panel and return
      flash[:notice] = "You have rejected the #{@request.freelancer.first_name.titleize} #{@request.freelancer.last_name.titleize}'s request!"
    elsif @request.freelancer.user.second_authorization_code == user_authorization_code
      @request.freelancer.user.update_attributes(second_authorization_code: nil)
      redirect_to @job_panel and return
      flash[:notice] = "You have rejected the #{@request.freelancer.first_name.titleize} #{@request.freelancer.last_name.titleize}'s request!"
    elsif @request.freelancer.user.third_authorization_code == user_authorization_code
      @request.freelancer.user.update_attributes(third_authorization_code: nil)
      redirect_to @job_panel and return
      flash[:notice] = "You have rejected the #{@request.freelancer.first_name.titleize} #{@request.freelancer.last_name.titleize}'s request!"
    elsif @request.freelancer.user.third_authorization_code == user_authorization_code
      @request.freelancer.user.update_attributes(third_authorization_code: nil)
      redirect_to @job_panel and return
      flash[:notice] = "You have rejected the #{@request.freelancer.first_name.titleize} #{@request.freelancer.last_name.titleize}'s request!"
    end

    if @request.freelancer.user.current_active_jobs_count >= 4
      @request.freelancer.user.update_attributes(current_active_jobs_count: 4)
    elsif @request.freelancer.user.current_active_jobs_count < 4
      @request.freelancer.user.increment!(:current_active_jobs_count)
    end

    redirect_to @job_panel
    flash[:notice] = "You have rejected the #{@request.freelancer.first_name.titleize} #{@request.freelancer.last_name.titleize}'s request!"
  end

  private

  def request_params
    params.require(:request).permit(:request_description)
  end
end
