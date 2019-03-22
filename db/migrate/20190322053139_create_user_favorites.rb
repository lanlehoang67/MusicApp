class CreateUserFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favorites do |t|
      t.string :id
      t.integer,user_id :
      t.integer,song_id :
      t.integer,video_id :
      t.integer,album_id :
      t.integer :

      t.timestamps
    end
  end
end
