class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true
  validates :lastname, presence: true

  %i[calories fat carbs protein].each do |nutrient|
    define_method("#{nutrient}_of_the_days") do |date = Date.today|
      meals = Meal.by_date_and_user(date, self)
      meals.sum(nutrient)
    end
  end
end
