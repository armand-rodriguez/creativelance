class RegistrationsController < Devise::RegistrationsController
  def create
    super
    Panel.create!(user_id: current_user.id)
  end

  protected

end
