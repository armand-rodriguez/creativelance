class AddPrivateAttributesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :objectives, :text
  end
end
