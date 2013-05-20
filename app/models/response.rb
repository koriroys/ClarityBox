class Response < ActiveRecord::Base
  attr_accessible :user_id, :response_text, :question_id

  belongs_to :question
  # belongs_to :week

  belongs_to :user

  validates :question, presence: true
  validates :user, presence: true, uniqueness: { scope :question_id}

  validate :user_cannot_respond_to_question_more_than_once

  def user_cannot_respond_to_question_more_than_once
    if self.user.responses.count >= 1
      errors.add(:user_id, "has already responded to this question")
    end
  end

end
