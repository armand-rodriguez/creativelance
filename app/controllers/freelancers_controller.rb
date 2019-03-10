class FreelancersController <ApplicationController
  def new
    @user = current_user
    @panel = @user.panel
    @account = @user.account
    @freelancer = Freelancer.new
  end
  def create
    @user = current_user
    @panel = @user.panel
    @account = @user.account

    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.update_attributes(account_id: @account.id, user_id: @user.id, panel_id: @panel.id)
    if @freelancer.save
      @account.update_attributes(registration_status_id: 2)
      redirect_to @panel
    else
      render 'new'
    end
  end

  def show
    @freelancer = Freelancer.find(params[:id])
  end

  private

  def freelancer_params
    params.require(:freelancer).permit(:skills, :specialization, :description, :resume)
  end
end
