class CreateJobPanels < ActiveRecord::Migration[5.2]
  def change
    create_table :job_panels do |t|

      t.timestamps
    end
  end
end
