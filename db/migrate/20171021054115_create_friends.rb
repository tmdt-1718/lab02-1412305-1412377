class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.integer :user1, foreign_key: true
      t.integer :user2, foreign_key: true

      t.timestamps
    end
  end
end
