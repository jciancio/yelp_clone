class Review < ActiveRecord::Base
  belongs_to :business
  has_one :photo, dependent: :destroy

  validates :business, presence: true
end
