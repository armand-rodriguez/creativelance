class AddReferencesToSubmission < ActiveRecord::Migration[5.2]
  def change
    add_column :submissions, :task_id, :integer, index: true
    add_column :submissions, :user_id, :integer, index: true
  end
end
