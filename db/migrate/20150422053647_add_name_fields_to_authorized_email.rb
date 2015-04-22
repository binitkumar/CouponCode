class AddNameFieldsToAuthorizedEmail < ActiveRecord::Migration
  def change
    add_column :authorized_emails, :first_name, :string
    add_column :authorized_emails, :last_name, :string
  end
end
