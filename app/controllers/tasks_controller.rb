class TasksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @task = Task.find(params[:id])
    @job = @task.job
    @job_room = @job.job_room
    @submission = @task.submissions.build
    @task_submissions = Submission.where(task_id: @task.id)
  end

  def new
    @user = current_user
    @job = Job.find(params[:job_id])
    if @job.user_id === @user.id
      @task = @job.tasks.build
    else
      flash[:alert] = 'You are not authorized to create a task for this job!'
      redirect_to jobs_path and return
    end
  end

  def create
    @user = current_user
    @job = Job.find(params[:job_id])
    if @job.user_id === @user.id
      @job_room = @job.job_room
      @task = @job.tasks.build(task_params)
      authorization_code = @job_room.authorization_code
      @task.update_attributes(authorization_code: authorization_code)
      @task.update_attributes(user_id: @user.id)
      @task.update_attributes(job_user_id: @job.user_id)
      if @task.save
        redirect_to job_task_path(@job, @task)
        flash[:notice] = "A task for this job has been successfully created!"
      else
        flash[:notice] = "There was an error while proccessing this task. Please try again."
        render 'new'
      end
    else
      flash[:alert] = 'You are not authorized to create a task for this job!'
      redirect_to jobs_path and return
    end
  end

  def destroy

  end

  def edit

  end

  def update

  end

  def accept
    @task = Task.find(params[:id])
    @task.update_attributes(task_status_id: 3)
    flash[:notice] = 'You have accepted this submission.'
    redirect_to @task
  end

  def reject
    @task = Task.find(params[:id])
    @task.update_attributes(task_status_id: 4)
    flash[:notice] = 'You have rejected this submission.'
    redirect_to @task
  end

  private

  def task_params
    params.require(:task).permit(:description, :task_title, images: [], documents: [])
  end

end
