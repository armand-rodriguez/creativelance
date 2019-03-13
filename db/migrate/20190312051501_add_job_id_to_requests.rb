class AddJobIdToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :job_id, :integer, index: true
  end
end
