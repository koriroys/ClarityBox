class AppRequest < ActiveRecord::Base
  attr_accessible :company, :email, :message, :name
  belongs_to :user
end
