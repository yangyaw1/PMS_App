class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.integer :num
      t.string :info

      t.timestamps
    end
  end
end
