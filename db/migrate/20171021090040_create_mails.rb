class CreateMails < ActiveRecord::Migration[5.1]
  def change
    create_table :mails do |t|
      t.string :subject
      t.string :content

      t.timestamps
    end
  end
end
