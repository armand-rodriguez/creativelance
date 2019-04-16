class AddAttrToPublicProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :public_profiles, :user_id, :integer, index: true
  end
end
