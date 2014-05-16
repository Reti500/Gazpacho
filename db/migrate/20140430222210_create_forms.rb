class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :name
      t.integer :user_id
      t.integer :project_id
      t.string :state

      t.timestamps
    end
  end
end
