class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.integer :owner_id
      t.references :user, index: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
