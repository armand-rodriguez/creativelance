class CreateRequestStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :request_statuses do |t|

      t.timestamps
    end
  end
end
