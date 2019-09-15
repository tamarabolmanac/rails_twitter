class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username,            null: false
      t.string :first_name,            null: false
      t.string :last_name,            null: false

      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt

      t.timestamps                null: false
    end

    add_index :users, :username, unique: true
  end
end
