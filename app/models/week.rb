class Week < ActiveRecord::Base
  attr_accessible :question_id, :week_number, :week_start, :week_stop

  has_many :questions
  has_many :responses

end
