class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.references :user, index: true
      t.integer :discount
      t.string :permalink_url

      t.timestamps
    end
  end
end
