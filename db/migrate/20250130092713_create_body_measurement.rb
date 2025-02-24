require_relative "../migration_helper.rb"

class CreateBodyMeasurement < ActiveRecord::Migration[8.0]
  def change
    # Use Active Record's configured type for primary and foreign keys
    primary_key_type, foreign_key_type = primary_and_foreign_key_types

    create_table :body_measurements, id: primary_key_type do |t|
      t.references :user, type: foreign_key_type, null: false, foreign_key: true
      t.date :date, null: false
      t.decimal :weight, null: false
      t.decimal :body_fat_percentage
      t.decimal :waist_size
      t.decimal :chest_size
      t.decimal :hip_size
      t.decimal :left_arm_size
      t.decimal :right_arm_size
      t.decimal :left_forearm_size
      t.decimal :right_forearm_size
      t.decimal :right_thighs_size
      t.decimal :left_thighs_size
      t.decimal :right_calves_size
      t.decimal :left_calves_size
      t.index [ :user_id, :date ], unique: true

      t.timestamps
    end
  end
end
