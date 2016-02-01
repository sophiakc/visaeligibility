class CreatePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :possible_answers do |t|
      t.string :content
      t.references :question, index: true, foreign_key: true
      t.integer :following_question_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
