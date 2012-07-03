class User < ActiveRecord::Base
  attr_accessible :name, :password_digest, :remember_token, :password
  
  has_secure_password
end
