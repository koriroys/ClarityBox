class Question < ActiveRecord::Base
  attr_accessible :question_text, :week_id, :user_id, :company_id, :ask_at, :remind_at, :send_roll_up_at

  belongs_to :week
  belongs_to :company
  belongs_to :user
  has_many :responses

  validates :company, presence: true
  validates :week, presence: true
  validates :question_text, presence: true
  validates :user, presence: true

end
