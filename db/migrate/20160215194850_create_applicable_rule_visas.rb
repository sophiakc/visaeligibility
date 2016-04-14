class CreateApplicableRuleVisas < ActiveRecord::Migration
  def change
    create_table :applicable_rule_visas do |t|
      t.references :visa, index: true, foreign_key: true
      t.references :applicable_rule, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
