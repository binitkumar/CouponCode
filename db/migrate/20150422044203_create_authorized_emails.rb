class CreateAuthorizedEmails < ActiveRecord::Migration
  def change
    create_table :authorized_emails do |t|
      t.references :hashtag, index: true
      t.string :email

      t.timestamps
    end
  end
end
