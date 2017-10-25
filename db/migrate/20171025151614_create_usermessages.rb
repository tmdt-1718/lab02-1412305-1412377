class CreateUsermessages < ActiveRecord::Migration[5.1]
  def change
    create_table :usermessages do |t|
      t.integer :from
      t.integer :to
      t.references :message, foreign_key: true
      t.string :status
      t.datetime :read_at

      t.timestamps
    end
  end
end
