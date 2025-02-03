class BodyMeasurementController < ApplicationController
  def index
    date = params[:date] || Date.today
    body_measurement = BodyMeasurement.by_date_and_user(date, current_user)
    body_measurement ||= BodyMeasurement.new(date: date)
    latest_measurements = BodyMeasurement.latest_measurements(current_user)
    render "index", locals: { body_measurement: body_measurement, date: date, body_measurements_path: "/body_measurement", latest_measurements: latest_measurements }
  end

  def create
    body_measurement = BodyMeasurement.new
    body_measurement.date = params[:date]
    body_measurement.weight = params[:weight]
    body_measurement.body_fat_percentage = params[:body_fat_percentage]
    body_measurement.waist_size = params[:waist_size]
    body_measurement.chest_size = params[:chest_size]
    body_measurement.hip_size = params[:hip_size]
    body_measurement.left_arm_size = params[:left_arm_size]
    body_measurement.right_arm_size = params[:right_arm_size]
    body_measurement.left_forearm_size = params[:left_forearm_size]
    body_measurement.right_forearm_size = params[:right_forearm_size]
    body_measurement.right_thighs_size = params[:right_thighs_size]
    body_measurement.left_thighs_size = params[:left_thighs_size]
    body_measurement.right_calves_size = params[:right_calves_size]
    body_measurement.left_calves_size = params[:left_calves_size]
    body_measurement.user = current_user

    body_measurement.save
    redirect_to action: :index, date: body_measurement.date
  end

  def update
    body_measurement = BodyMeasurement.find(params[:id])
    if body_measurement.user != current_user
      redirect_to body_measurement, notice: 'You are not allowed to update this body measurement.'
    end

    body_measurement.weight = params[:weight]
    body_measurement.body_fat_percentage = params[:body_fat_percentage].presence || nil
    body_measurement.waist_size = params[:waist_size].presence || nil
    body_measurement.chest_size = params[:chest_size].presence || nil
    body_measurement.hip_size = params[:hip_size].presence || nil
    body_measurement.left_arm_size = params[:left_arm_size].presence || nil
    body_measurement.right_arm_size = params[:right_arm_size].presence || nil
    body_measurement.left_forearm_size = params[:left_forearm_size].presence || nil
    body_measurement.right_forearm_size = params[:right_forearm_size].presence || nil
    body_measurement.right_thighs_size = params[:right_thighs_size].presence || nil
    body_measurement.left_thighs_size = params[:left_thighs_size].presence || nil
    body_measurement.right_calves_size = params[:right_calves_size].presence || nil
    body_measurement.left_calves_size = params[:left_calves_size].presence || nil
  
    body_measurement.save
    redirect_to action: :index, date: body_measurement.date
  end
end