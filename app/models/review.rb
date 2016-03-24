class Review < ActiveRecord::Base
  belongs_to :business
  has_one :photo, dependent: :destroy

  validates :title, :description, presence: true

  validates :business, presence: true
end
