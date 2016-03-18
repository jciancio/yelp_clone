class User < ActiveRecord::Base
  has_secure_password
  has_many :businesses, dependent: :destroy
  has_one :photo, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
            uniqueness: true

  def to_s
    "#{name}"
  end
end
