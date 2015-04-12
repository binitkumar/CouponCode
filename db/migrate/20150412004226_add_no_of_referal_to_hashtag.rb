class AddNoOfReferalToHashtag < ActiveRecord::Migration
  def change
    add_column :hashtags, :no_of_referal, :integer
  end
end
