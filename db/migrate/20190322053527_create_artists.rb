class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :id
      t.integer,name :
      t.varchar,date_of_birth :
      t.datetime,begin_year :
      t.datetime,end_date :
      t.datetime,website :
      t.varchar,picture_id :
      t.int :

      t.timestamps
    end
  end
end
