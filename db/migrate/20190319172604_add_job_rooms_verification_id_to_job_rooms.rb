class AddJobRoomsVerificationIdToJobRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :job_rooms, :authorization_code, :string
  end
end
