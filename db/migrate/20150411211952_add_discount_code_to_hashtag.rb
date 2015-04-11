class AddDiscountCodeToHashtag < ActiveRecord::Migration
  def change
    add_column :hashtags, :discount_code, :string
  end
end
