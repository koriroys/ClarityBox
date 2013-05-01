class Response < ActiveRecord::Base
  attr_accessible :question_id, :response_text, :user_name
end
