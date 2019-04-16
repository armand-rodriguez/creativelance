class AddPostionToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :postion, :string
  end
end
