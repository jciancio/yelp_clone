class Review < ActiveRecord::Base
  belongs_to :business
  has_one :photo
end
