class User < ActiveRecord::Base
  PASSWORD_REQUIREMENTS = /\A
    (?=.{6,})
  /x
  
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, format: PASSWORD_REQUIREMENTS
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    stripped = email.strip! || email
    @user = User.where("LOWER(email) = ?", stripped.downcase).first

    if @user && @user.authenticate(password)
      return @user
    end
    nil
  end
end
