class Hashtag < ActiveRecord::Base
  belongs_to :user

  before_create :create_unique_identifier

  def create_unique_identifier
    begin
      self.discount_code = SecureRandom.hex(8) # or whatever you chose like UUID tools
    end while self.class.exists?(:discount_code => discount_code)
  end
end
