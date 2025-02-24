require_relative "../migration_helper.rb"

class CreateMeals < ActiveRecord::Migration[8.0]
  def change
    # Use Active Record's configured type for primary and foreign keys
    primary_key_type, foreign_key_type = primary_and_foreign_key_types

    create_table :meals, id: primary_key_type do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.integer :meal_type, null: false, default: 0
      t.integer :calories, null: false, default: 0
      t.integer :carbs, null: false, default: 0
      t.integer :protein, null: false, default: 0
      t.integer :fat, null: false, default: 0
      t.references :user, type: foreign_key_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
