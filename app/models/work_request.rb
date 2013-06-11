class WorkRequest < ActiveRecord::Base
  attr_accessible :company, :email, :message, :name

  validates :email, presence:true
end
