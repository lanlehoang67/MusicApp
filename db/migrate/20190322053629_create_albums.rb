class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :id
      t.integer,name :
      t.varchar,artist_id :
      t.integer,picture :
      t.varchar :

      t.timestamps
    end
  end
end
