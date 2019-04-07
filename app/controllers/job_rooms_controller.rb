class JobRoomsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def show
    @job_room = JobRoom.find(params[:id])
    @job = @job_room.job
    @tasks = @job.tasks.order("created_at ASC")
    @total_tasks = @tasks.count
    @approved_tasks = Task.where(job_id: @job.id, task_status_id: 3)
    @total_approved_tasks = @approved_tasks.count
    @total_unfinished_tasks = @total_tasks - @total_approved_tasks
  end

  def edit
  end

  private

  def job_room_params
    params.fetch(:job_room, {})
  end
end
