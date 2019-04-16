class ConfirmationsController < Devise::ConfirmationsController

  private
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) # In case you want to sign in the user
    Panel.create!(user_id: current_user.id)
    PublicProfile.create!(user_id: current_user.id)
    root_path
  end
end
