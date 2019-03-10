class StaticController < ApplicationController
  def index
    if user_signed_in?
      @panel = Panel.find_by(user_id: current_user.id)
      redirect_to new_account_path
    end
  end
  def contact

  end
end
