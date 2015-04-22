class AddAuthorizedEmailToHashtag < ActiveRecord::Migration
  def change
    add_column :hashtags, :authorized_email, :string
  end
end
