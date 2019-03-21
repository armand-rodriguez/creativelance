class AddJobIdToJobRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :job_rooms, :job_id, :integer, index: true
    add_column :job_rooms, :user_id, :integer, index: true
  end
end
