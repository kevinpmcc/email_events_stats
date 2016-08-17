class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :address
      t.string :email_type
      t.string :event
      t.timestamp :timestamp

      t.timestamps null: false
    end
  end
end
