class AddUserReferencesToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :user_id, :integer, index: true
  end
end
