class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
  add_index :users, :email, unique:true
  add_column :users, :password_digest, :string
  add_column :users, :admin, :boolean, default: false
end
