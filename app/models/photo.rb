class Photo < ActiveRecord::Base
  belongs_to :business
  belongs_to :user
  belongs_to :review

  # I Want to do some sort of validation that checks for
  # either of these upon creation of a photo
  # validates (:business || :user || :review), presence: true
end
