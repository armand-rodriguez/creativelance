class CreateRegistrationStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :registration_statuses do |t|

      t.timestamps
    end
  end
end
