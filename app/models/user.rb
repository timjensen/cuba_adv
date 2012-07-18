class User < ActiveRecord::Base
  attr_accessible :name, :password
  
  has_secure_password
  
   before_save :create_remember_token
  
  private
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
