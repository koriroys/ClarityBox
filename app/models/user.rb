class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :company_id, :email, :first_name, :last_name, :user_role, :password, :password_confirmation, :avatar, :employee_invite

  belongs_to :company
  has_many :questions
  has_many :responses
  has_many :app_requests

  mount_uploader :avatar, AvatarUploader

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: true
  validates :user_role, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true


def self.generate_password
  SecureRandom.urlsafe_base64
end




end
