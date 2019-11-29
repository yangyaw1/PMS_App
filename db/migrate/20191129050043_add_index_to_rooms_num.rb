class AddIndexToRoomsNum < ActiveRecord::Migration[6.0]
  def change
  	add_index(:rooms, :num, unique:true)
  end
end
