class AddRegistrationStatusToAccounts < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :registration_status_id, :integer, index: true, default: 1
  end
end
