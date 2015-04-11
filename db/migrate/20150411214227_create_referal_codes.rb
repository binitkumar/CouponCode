class CreateReferalCodes < ActiveRecord::Migration
  def change
    create_table :referal_codes do |t|
      t.references :hashtag, index: true
      t.string :email
      t.string :code

      t.timestamps
    end
  end
end
