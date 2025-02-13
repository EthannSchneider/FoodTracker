class Meal < ApplicationRecord
  validates :name, :meal_type, :date, :calories, :carbs, :protein, :fat, presence: true
  validates :meal_type, inclusion: { in: 0..3 }

  belongs_to :user
  has_one_attached :picture

  def self.by_date_and_user(date, user)
   where(date: date, user: user)
  end
end
