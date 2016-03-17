class User < ActiveRecord::Base
  has_secure_password
  has_many :businesses
  has_one :photo

  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: true

  def to_s
    "#{name}"
  end
end
