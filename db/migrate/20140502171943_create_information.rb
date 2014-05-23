class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.text :info
      t.integer :question_id
      t.integer :user_id
      t.string :state,				default: "Activo"

      t.timestamps
    end
  end
end
