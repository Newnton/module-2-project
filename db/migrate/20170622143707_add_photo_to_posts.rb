class AddPhotoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_attachment :posts, :photo
  end
end
