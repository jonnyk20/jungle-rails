class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  has_secure_password
  has_many :reviews

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email)
    @user.authenticate(password)
  end
end
