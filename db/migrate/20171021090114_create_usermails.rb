class CreateUsermails < ActiveRecord::Migration[5.1]
  def change
    create_table :usermails do |t|
      t.references :user, foreign_key: true
      t.references :mail, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
