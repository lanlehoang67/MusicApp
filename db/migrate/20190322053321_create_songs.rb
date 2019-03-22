class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :id
      t.integer,artist_id :
      t.integer,url :
      t.varchar,title :
      t.varchar,content :
      t.varchar,length :
      t.integer :
      t.string :,views
      t.biginteger,genre_id :
      t.integer,album_id :
      t.integer,status :
      t.varchar :

      t.timestamps
    end
  end
end
