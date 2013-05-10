class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :company_id, :email, :first_name, :last_name, :password_digest, :user_role, :password, :password_confirmation

  belongs_to :company

end