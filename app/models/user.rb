class User < ActiveRecord::Base
  has_secure_password

  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 5, maximum: 20 }, on: :create
  
  validates :email, presence:true, confirmation: { case_sensitive: false }, uniqueness: true
  
  def self.authenticate_with_credentials( email, password )
    user = User.find_by_email(email)

    if user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
