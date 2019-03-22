class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :id
      t.integer,title :
      t.varchar,description :
      t.varchar :

      t.timestamps
    end
  end
end
