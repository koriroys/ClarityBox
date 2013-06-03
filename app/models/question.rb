class Question < ActiveRecord::Base
  attr_accessible :question_text, :week_id, :user_id, :company_id, :ask_at, :remind_at, :send_roll_up_at, :send_question, :send_reminder, :send_rollup

  belongs_to :week
  belongs_to :company
  belongs_to :user
  has_many :responses

  # after_save :set_question_settings
  before_save :assign_question_settings
  before_save :retrieve_send_dates

  validates :company, presence: true
  validates :week, presence: true
  validates :question_text, presence: true
  validates :user, presence: true

  def self.get_this_week_and_company(company_id)
    week = Week.get_this_week
    find_by_week_id_and_company_id(week.id, company_id)
  end

  def retrieve_send_dates
    this_week = self.week
    this_company = self.company

    day = Date::DAYNAMES[this_company.send_question_day_of_week]
    ask_at_day = this_week.start_date.beginning_of_week(day.downcase.to_sym) + 1.week
    self.ask_at = DateTime.new(ask_at_day.year, ask_at_day.month, ask_at_day.day, this_company.send_question_time.hour, this_company.send_question_time.min, this_company.send_question_time.sec)

    day = Date::DAYNAMES[this_company.send_reminder_day_of_week]
    remind_at_day = this_week.start_date.beginning_of_week(day.downcase.to_sym) + 1.week
    self.remind_at = DateTime.new(remind_at_day.year, remind_at_day.month, remind_at_day.day, this_company.send_reminder_time.hour, this_company.send_reminder_time.min, this_company.send_reminder_time.sec)

    day = Date::DAYNAMES[this_company.send_rollup_day_of_week]
    send_rollup_at_day = this_week.start_date.beginning_of_week(day.downcase.to_sym) + 2.weeks
    self.send_roll_up_at = DateTime.new(send_rollup_at_day.year, send_rollup_at_day.month, send_rollup_at_day.day, this_company.send_rollup_time.hour, this_company.send_rollup_time.min, this_company.send_rollup_time.sec)

  end



  private

  # def set_question_settings
  #   if self.send_question == false
  #     self.send_reminder = false
  #     self.send_rollup = false
  #   end
  # end

def assign_question_settings
  if self.send_question == false
    self.send_reminder = false
    self.send_rollup = false
  end
  true
end

end
