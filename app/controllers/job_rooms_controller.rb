class JobRoomsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
  def show
    @job_room = JobRoom.find(params[:id])
  end

  def edit
  end

  private

  def job_room_params
    params.fetch(:job_room, {})
  end
end
