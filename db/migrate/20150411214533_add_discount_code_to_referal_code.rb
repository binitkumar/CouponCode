class AddDiscountCodeToReferalCode < ActiveRecord::Migration
  def change
    add_column :referal_codes, :discount_code, :string
  end
end
