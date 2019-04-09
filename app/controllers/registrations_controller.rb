class RegistrationsController < Devise::RegistrationsController
  def create
    super
    # if @user.save
    #   Panel.create!(user_id: current_user.id)
    #   PublicProfile.create!(user_id: current_user.id)
    # end
  end

  protected

end
