class AddBusinessRefToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :business, index: true, foreign_key: true
  end
end
