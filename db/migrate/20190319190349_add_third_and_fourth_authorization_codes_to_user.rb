class AddThirdAndFourthAuthorizationCodesToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :third_authorization_code, :string
    add_column :users, :fourth_authorization_code, :string
  end
end
