class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :rabbi
  belongs_to :service

  validates :time_and_date, :service_id, presence: true
  accepts_nested_attributes_for :rabbi

  validate :does_not_conflict_other_appointments, :during_regular_hours, :not_on_saturday




  scope :future_appointments, -> (user_id) {where("user_id = ? AND time_and_date > ?",user_id, Time.current )}



  def rabbi_attributes=(attributes)
    self.rabbi = Rabbi.find_or_create_by(attributes)
  end




  private


  def does_not_conflict_other_appointments
    errors.add(:time_and_date, "already taken by another appointment") if time_and_date &&  rabbi.appointments.where(time_and_date: (time_and_date - 15.minutes..time_and_date + 1.hours)).where.not(user_id: user_id).exists?
  end

  def during_regular_hours
    errors.add(:time_and_date, "Not between hours 8:30 AM - 6:30 PM") unless time_and_date && time_and_date.strftime("%H%M").to_i >= 830 && time_and_date.strftime("%H%M").to_i <= 1830
  end

  def not_on_saturday
    errors.add(:time_and_date, "can not be on saturday") if time_and_date && time_and_date.saturday?
  end





end
