class ChangeDiscountFromHashtag < ActiveRecord::Migration
  def change
    change_column :hashtags, :discount, :string
  end
end
