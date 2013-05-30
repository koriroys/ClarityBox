class Question < ActiveRecord::Base
  attr_accessible :question_text, :week_id, :user_id, :company_id, :ask_at, :remind_at, :send_roll_up_at, :send_question, :send_reminder, :send_rollup

  belongs_to :week
  belongs_to :company
  belongs_to :user
  has_many :responses

  after_save :set_question_settings

  validates :company, presence: true
  validates :week, presence: true
  validates :question_text, presence: true
  validates :user, presence: true


  private

  def set_question_settings
    if self.send_question == false
      self.send_reminder = false
      self.send_rollup = false
    end
  end

end
