class Response < ActiveRecord::Base
  attr_accessible :user_id, :response_text, :question_id

  belongs_to :question
  # belongs_to :week

  belongs_to :user

end
