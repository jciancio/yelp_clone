class Business < ActiveRecord::Base
  has_many :reviews
  has_many :photos
  belongs_to :user
end
