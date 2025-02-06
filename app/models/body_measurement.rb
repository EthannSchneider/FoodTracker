class BodyMeasurement < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :weight, presence: true, numericality: { greater_than: 0 }
  validates :body_fat_percentage, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true
  validates :waist_size, :chest_size, :hip_size, :left_arm_size, :right_arm_size, :left_forearm_size, :right_forearm_size, :right_thighs_size, :left_thighs_size, :right_calves_size, :left_calves_size, numericality: { greater_than: 0 }, allow_nil: true
  validates_uniqueness_of :date, scope: :user_id

  has_one_attached :picture

  def self.by_date_and_user(date, user)
    find_by(date: date, user: user)
  end

  def self.latest_measurements(user)
    where(user: user).order(date: :desc)
  end
end
