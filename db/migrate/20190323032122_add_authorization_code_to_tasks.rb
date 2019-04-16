class AddAuthorizationCodeToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :authorization_code, :string
  end
end
