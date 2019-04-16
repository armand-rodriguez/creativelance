class JobPanelsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def show
    @job_panel = JobPanel.find(params[:id])
    @job = @job_panel.job
    @requests = @job.requests
  end

end
