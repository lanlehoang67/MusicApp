class CreateLyrics < ActiveRecord::Migration[5.2]
  def change
    create_table :lyrics do |t|
      t.string :id
      t.integer,start :
      t.int, :
      t.string :end
      t.int,content :
      t.varchar,song_id :
      t.int :

      t.timestamps
    end
  end
end
