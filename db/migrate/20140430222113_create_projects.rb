class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.string :state,			default: "Activo"

      t.timestamps
    end
  end
end
