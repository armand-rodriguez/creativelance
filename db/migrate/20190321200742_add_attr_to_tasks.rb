class AddAttrToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :description, :text
    add_column :tasks, :job_id, :integer, index: true
    add_column :tasks, :task_status_id, :integer, index: true, default: 1
  end
end
