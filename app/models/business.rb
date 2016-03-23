class Business < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  belongs_to :user

  validates :name, :description, :address, :city, :state, :zip,
            presence: true

  validates :name, :address, uniqueness: true

  validates :user, presence: true

  def to_s
    "Business Name: #{name}, Description: #{description}"
  end
end
