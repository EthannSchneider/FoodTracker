class Meal < ApplicationRecord
  validates :name, :meal_type, :date, :calories, :carbs, :protein, :fat, presence: true
  validates :meal_type, inclusion: { in: 0..3 }

  belongs_to :user

  def self.today
    where(date: Date.today)
  end

  def self.by_date_and_user(date, user)
    where(date: date, user: user)
  end
end