class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :picture
      t.integer :capacity

      t.timestamps
    end
  end
end
