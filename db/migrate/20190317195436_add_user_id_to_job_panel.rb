class AddUserIdToJobPanel < ActiveRecord::Migration[5.2]
  def change
    add_column :job_panels, :user_id, :integer, index: true
  end
end
