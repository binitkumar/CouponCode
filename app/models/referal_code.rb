class ReferalCode < ActiveRecord::Base
  belongs_to :hashtag

  validate :validate_discount_code
  before_create :create_unique_identifier

  def create_unique_identifier
    begin
      self.code = SecureRandom.hex(8) # or whatever you chose like UUID tools
    end while self.class.exists?(:code => code)

    Notification.referal(self).deliver
  end

  def validate_discount_code
    related_hashtag = Hashtag.where(discount_code: self.discount_code).first
    errors.add(:discount_code, "in invalid") unless related_hashtag || related_hashtag.referal_codes.length > related_hashtag.no_of_referal
  end
end
