class Company < ActiveRecord::Base
  attr_accessible :name, :send_question_day_of_week, :send_question_time, :send_reminder_day_of_week, :send_reminder_time, :send_rollup_day_of_week, :send_rollup_time

  has_many :users
  has_many :questions

  validates :name, presence: true, uniqueness: true


end
