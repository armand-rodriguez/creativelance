class AddSecondAuthorizationCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :second_authorization_code, :string
  end
end
