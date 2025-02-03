class CreateBodyMeasurement < ActiveRecord::Migration[8.0]
  def change
    create_table :body_measurements do |t|
      t.references :user, null: false, foreign_key: true
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
      t.index [:user_id, :date], unique: true

      t.timestamps
    end
  end
end
