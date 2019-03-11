class FreelancersController <ApplicationController
  load_and_authorize_resource

  def new
    @user = current_user
    @panel = @user.panel
    if @user.registration_status_id == 1
      flash[:alert] = "You need to create an account type first!"
      redirect_to new_account_path and return
    end
    if @user.account
      @account = @user.account

      if @user.registration_status_id >= 3
        flash[:alert] = "You have already created an account!"
        redirect_to @panel and return
      end
      if @account.account_type == "Recruiter"
        flash[:alert] = "You have created a recruiter account and are unable to create a freelancer account with this user!"
        redirect_to new_recruiter_path and return
      end
      @freelancer = Freelancer.new
    end
  end
  def create
    @user = current_user
    @panel = @user.panel
    @account = @user.account
    if @user.registration_status_id >= 3
      flash[:alert] = "You have already created an account!"
      redirect_to @panel and return

    end
    if @account.account_type == "Recruiter"
      flash[:alert] = "You have created a freelancer account and are unable to create a recruiter account with this user!"
      redirect_to new_recruiter_path and return
    end
    @freelancer = Freelancer.new(freelancer_params)
    @freelancer.update_attributes(account_id: @account.id, user_id: @user.id, panel_id: @panel.id)
    if @freelancer.save
      @user.update_attributes(registration_status_id: 3)
      flash[:notice] = "You freelancer profile was successfully created!"
      redirect_to @panel
    else
      render :new
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
