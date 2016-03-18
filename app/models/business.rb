class Business < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  belongs_to :user

  validates :user, presence: true
end
