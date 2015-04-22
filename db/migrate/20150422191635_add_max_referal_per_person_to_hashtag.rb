class AddMaxReferalPerPersonToHashtag < ActiveRecord::Migration
  def change
    add_column :hashtags, :max_referal_per_person, :integer
  end
end
