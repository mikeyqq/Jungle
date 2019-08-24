class User < ActiveRecord::Base
  has_secure_password

  # attr_accessor :password
  # before_create :encrypt_password

  # def encrypt_password
  #   self.password_digest = "encrypted!"
  # end
end
