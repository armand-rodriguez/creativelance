class AddJobUserIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :job_user_id, :integer
  end
end
