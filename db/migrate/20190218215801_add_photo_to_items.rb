class AddPhotoToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :photo, :string, default: "https://res.cloudinary.com/djky9y7t0/image/upload/v1550615358/msxjzr4dczdqk6xn0w14.png"
  end
end
