class CreateQtypes < ActiveRecord::Migration
  def change
    create_table :qtypes do |t|
      t.string :name
      t.string :state,			default: "Activo"

      t.timestamps
    end
  end
end
