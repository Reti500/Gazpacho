class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.integer :qtype_id
      t.integer :form_id
      t.string :state,			default: "Activo"

      t.timestamps
    end
  end
end
