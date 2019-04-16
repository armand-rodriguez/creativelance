class AddAccountTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_type, :integer, default: 1
  end
end
