class CreateApplicableRules < ActiveRecord::Migration
  def change
    create_table :applicable_rules do |t|
      t.text :criteria_content

      t.timestamps null: false
    end
  end
end
