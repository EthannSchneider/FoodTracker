class MealController < ApplicationController
  def index
    create_meal_path = "/meal"
    date = params[:date] || Date.today
    meals = Meal.by_date_and_user(date, current_user)
    render "index", locals: { meals: meals, create_meal_path: create_meal_path, date: date, meals_path: "/meal" }
  end

  def create
    meal = Meal.new
    meal.name = params[:name]
    meal.meal_type = params[:meal_type]
    meal.date = params[:date]
    meal.calories = params[:calories]
    meal.carbs = params[:carbs]
    meal.protein = params[:protein]
    meal.fat = params[:fat]
    meal.user = current_user

    if meal.save
      redirect_to root_path, notice: 'Meal has been created'
    else
      redirect_to root_path, alert: 'Meal could not be created'
    end
  end

  def destroy
    meal = Meal.find(params[:id])
    meal.destroy
    redirect_to root_path, notice: 'Meal has been deleted'
  end

  def update
    meal = Meal.find(params[:id])
    if meal.user != current_user
      redirect_to root_path, alert: 'You are not authorized to update this meal'
      return
    end
    meal.name = params[:name]
    meal.meal_type = params[:meal_type]
    meal.calories = params[:calories]
    meal.carbs = params[:carbs]
    meal.protein = params[:protein]
    meal.fat = params[:fat]

    if meal.save
      redirect_to root_path, notice: 'Meal has been updated'
    else
      redirect_to root_path, alert: 'Meal could not be updated'
    end
  end
end
