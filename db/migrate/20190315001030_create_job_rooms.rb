class CreateJobRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :job_rooms do |t|

      t.timestamps
    end
  end
end
