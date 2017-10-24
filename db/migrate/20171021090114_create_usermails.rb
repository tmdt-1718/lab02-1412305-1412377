class CreateUsermails < ActiveRecord::Migration[5.1]
  def change
    create_table :usermails do |t|
      t.integer :from, foreign_key: true
      t.integer :to, foreign_key: true
      t.references :mail, foreign_key: true
      t.string :status
      t.datetime :read_at, null: true

      t.timestamps
    end
  end
end
