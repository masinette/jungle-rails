class User < ActiveRecord::Base
  has_secure_password
  #check if email exists before saving
  validates :email, uniqueness: true

end
