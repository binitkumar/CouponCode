class ReferalCode < ActiveRecord::Base
  belongs_to :hashtag

  validate :validate_discount_code
  after_create :create_unique_identifier

  def create_unique_identifier
    begin
      self.code = SecureRandom.hex(8) # or whatever you chose like UUID tools
    end while self.class.exists?(:code => code)

    Notification.referal(self).deliver
  end

  def validate_discount_code
    errors.add(:discount_code, "in invalid") if Hashtag.where(discount_code: self.discount_code).length == 0
  end
end
