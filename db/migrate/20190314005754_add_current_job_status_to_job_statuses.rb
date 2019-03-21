class AddCurrentJobStatusToJobStatuses < ActiveRecord::Migration[5.2]
  def change
    add_column :job_statuses, :current_job_status, :string
  end
end
