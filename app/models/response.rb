class Response < ActiveRecord::Base
  attr_accessible :answer, :question_id, :user_name
end
