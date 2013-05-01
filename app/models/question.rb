class Question < ActiveRecord::Base
  attr_accessible :question_text, :week_id

  belongs_to :week
  has_many :responses

end
