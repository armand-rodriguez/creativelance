class RequestsController < ApplicationController

  def create
    @user = current_user
    @account = @user.account
    @panel = @user.panel
    @freelancer = @account.freelancer
    @job = Job.find(params[:job_id])
    @request = @job.requests.build(request_params)
    @request.update_attributes(freelancer_id: @freelancer.id, job_id: @job.id)
    if @request.save
      flash[:notice] = "Your job request has been sent successfully!"
      redirect_to @job
    else
      flash[:alert] = "Something has gone wrong with your request!"
      byebug
      redirect_to @job
    end
  end
  def destroy

  end

  private

  def request_params
    params.require(:request).permit(:request_description)
  end
end
