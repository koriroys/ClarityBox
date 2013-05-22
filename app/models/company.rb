class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :users
  has_many :questions

  validates :name, presence: true, uniqueness: true
end
