class User < ActiveRecord::Base
  has_secure_password
  PASSWORD_REQUIREMENTS = /\A
    (?=.{6,})
  /x
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, format: PASSWORD_REQUIREMENTS
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)

  end
end
