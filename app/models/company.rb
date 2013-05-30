class Company < ActiveRecord::Base
  attr_accessible :name, :send_question_date, :send_question_time, :send_reminder_date, :send_reminder_time, :send_rollup_date, :send_rollup_time

  has_many :users
  has_many :questions

  validates :name, presence: true, uniqueness: true
end
