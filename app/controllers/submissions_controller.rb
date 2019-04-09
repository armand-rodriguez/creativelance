class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def create
    @user = current_user
    @task = Task.find(params[:task_id])
    @job = @task.job
    if @user.id === @task.user_id || @job.job_room.authorization_code === @user.authorization_code || @job.job_room.authorization_code === @user.second_authorization_code || @job.job_room.authorization_code === @user.third_authorization_code || @job.job_room.authorization_code === @user.fourth_authorization_code
      @submission = @task.submissions.build(submission_params)
      @submission.update_attributes(user_id: @user.id, job_id: @job.id)
      if @submission.save
        flash[:notice] = 'You have made a submission'
          @task.update_attributes(task_status_id: 2)
        redirect_to @task
      else
        flash[:notice] = 'Something has gone wrong with this submission. Please try again.'
        redirect_to @task
      end
    else
      flash[:notice] = 'You are not authorized to create submissions on this job and/or task.'
      redirect_to jobs_path and return
    end

  end

  private

  def submission_params
    params.require(:submission).permit(:description, :link, images: [], documents: [])
  end
end
