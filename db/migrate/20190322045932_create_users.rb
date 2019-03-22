class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :id
      t.integer,full_name :
      t.varchar,email :
      t.varchar,gender :
      t.boolean,date_of_birth :
      t.varchar,picture :
      t.varchar,admin :
      t.boolean :

      t.timestamps
    end
  end
end
