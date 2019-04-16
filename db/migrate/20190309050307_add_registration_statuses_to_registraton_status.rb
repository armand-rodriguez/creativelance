class AddRegistrationStatusesToRegistratonStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :registration_statuses, :reg_status, :string
  end
end
