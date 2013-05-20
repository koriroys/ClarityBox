class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :company_id, :email, :first_name, :last_name, :password_digest, :user_role, :password, :password_confirmation

  belongs_to :company
  has_many :questions
  has_many :responses

  validates :email, presence: true, uniqueness: true

end
