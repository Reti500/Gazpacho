class CreateQtypes < ActiveRecord::Migration
  def change
    create_table :qtypes do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
