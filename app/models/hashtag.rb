class Hashtag < ActiveRecord::Base
  belongs_to :user

  #before_create :create_unique_identifier

  validates_uniqueness_of :discount_code
  validates_presence_of :discount_code

  validates_presence_of :no_of_referal
  #def create_unique_identifier
  #  begin
  #    self.discount_code = SecureRandom.hex(8) # or whatever you chose like UUID tools
  #  end while self.class.exists?(:discount_code => discount_code)
  #end
end
