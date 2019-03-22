class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
      t.string :id
      t.integer,song_id :
      t.integer, :
      t.string :genre_id
      t.integer :

      t.timestamps
    end
  end
end
