class RenameEmailsTableToEmailEvents < ActiveRecord::Migration
  def change
     rename_table :emails, :email_events
  end
end
