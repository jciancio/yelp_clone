class User < ActiveRecord::Base
  has_secure_password
  has_many :businesses
  has_one :photo
end
