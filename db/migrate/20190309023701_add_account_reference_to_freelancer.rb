class AddAccountReferenceToFreelancer < ActiveRecord::Migration[5.2]
  def change
    add_column :freelancers, :user_id, :integer, index: true
    add_column :freelancers, :account_id, :integer, index: true
  end
end
