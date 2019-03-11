class AddUserIdAccountIdAndPanelIdToRecruiter < ActiveRecord::Migration[5.2]
  def change
    add_column :recruiters, :user_id, :integer, index: true
    add_column :recruiters, :account_id, :integer, index: true
    add_column :recruiters, :panel_id, :integer, index: true
  end
end
