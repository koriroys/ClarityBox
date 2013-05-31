class Question < ActiveRecord::Base
  attr_accessible :question_text, :week_id, :user_id, :company_id, :ask_at, :remind_at, :send_roll_up_at, :send_question, :send_reminder, :send_rollup

  belongs_to :week
  belongs_to :company
  belongs_to :user
  has_many :responses

  # after_save :set_question_settings
  before_save :assign_question_settings

  validates :company, presence: true
  validates :week, presence: true
  validates :question_text, presence: true
  validates :user, presence: true

  def self.get_this_week_and_company(company_id)
    week = Week.get_this_week
    find_by_week_id_and_company_id(week.id, company_id)
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
