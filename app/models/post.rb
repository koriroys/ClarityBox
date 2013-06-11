class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title

  validates :content, presence: true
  validates :name, presence: true
  validates :title, presence: true
end
