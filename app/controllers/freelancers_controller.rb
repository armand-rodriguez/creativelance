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
      @user.update_attributes(registration_status_id: 3)
      flash[:notice] = "You freelancer profile was successfully created!"
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
    params.require(:freelancer).permit(:skills, :specialization, :description, :resume, :first_name, :last_name)
  end
end
