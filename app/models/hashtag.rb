class Hashtag < ActiveRecord::Base
  belongs_to :user
  has_many :referal_codes
  has_many :authorized_emails

  accepts_nested_attributes_for :authorized_emails, allow_destroy: true
  #before_create :create_unique_identifier

  validates_uniqueness_of :discount_code
  validates_presence_of :discount_code

  validates_presence_of :no_of_referal, :max_referal_per_person
  #def create_unique_identifier
  #  begin
  #    self.discount_code = SecureRandom.hex(8) # or whatever you chose like UUID tools
  #  end while self.class.exists?(:discount_code => discount_code)
  #end
end
