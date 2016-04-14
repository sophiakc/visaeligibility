class CreateApplicableRulePossibleAnswers < ActiveRecord::Migration
  def change
    create_table :applicable_rule_possible_answers do |t|
      t.references :possible_answer, index: true, foreign_key: true
      t.references :applicable_rule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
