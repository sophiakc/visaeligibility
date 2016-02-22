class CreateVisas < ActiveRecord::Migration
  def change
    create_table :visas do |t|
      t.string :name
      t.string :scenario
      t.integer :coefficient_easy_to_get

      t.timestamps null: false
    end
  end
end
