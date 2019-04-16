class AddCurrentJobsCountToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_active_jobs_count, :integer, default: 4
  end
end
