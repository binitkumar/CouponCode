class AddNameFieldsToReferalCode < ActiveRecord::Migration
  def change
    add_column :referal_codes, :first_name, :string
    add_column :referal_codes, :last_name, :string
  end
end
