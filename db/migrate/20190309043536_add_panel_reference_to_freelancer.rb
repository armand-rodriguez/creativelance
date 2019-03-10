class AddPanelReferenceToFreelancer < ActiveRecord::Migration[5.2]
  def change
    add_column :freelancers, :panel_id, :integer, index: true
  end
end
