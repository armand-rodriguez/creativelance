class CreatePublicProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :public_profiles do |t|

      t.timestamps
    end
  end
end
