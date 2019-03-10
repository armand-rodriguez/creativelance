class AddUserRefeerenceAndAccountReferenceToPanel < ActiveRecord::Migration[5.2]
  def change
    add_column :panels, :user_id, :integer, index: true
    add_column :panels, :account_id, :integer, index: true
  end
end
