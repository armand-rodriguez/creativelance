class RenamePostionToPosition < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :postion, :position
  end
end
