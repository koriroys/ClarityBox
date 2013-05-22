class Response < ActiveRecord::Base
  attr_accessible :user_id, :response_text, :question_id, :yes_response, :public_response

  belongs_to :question
  # belongs_to :week

  belongs_to :user

  validates :user, presence: true
  validates :question, presence: true
  validates :response_text, presence: true

  validates :user_id, uniqueness: { scope: :question_id, message: "has already responded to this question" }


  # validate :user_cannot_respond_to_question_more_than_once

  # def user_cannot_respond_to_question_more_than_once
  #   if self.user.responses.count >= 1
  #     errors.add(:user_id, "you can only respond once")
  #   end
  # end

end
