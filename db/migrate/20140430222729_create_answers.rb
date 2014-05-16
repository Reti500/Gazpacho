class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :question_id
      t.string :state

      t.timestamps
    end
  end
end
