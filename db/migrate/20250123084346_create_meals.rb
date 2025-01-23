class CreateMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.integer :meal_type, null: false, default: 0
      t.integer :calories, null: false, default: 0
      t.integer :carbs, null: false, default: 0
      t.integer :protein, null: false, default: 0
      t.integer :fat, null: false, default: 0
      t.references :user, null: false, foreign_key: true 

      t.timestamps
    end
  end
end
