class ReferalCode < ActiveRecord::Base
  belongs_to :hashtag

  validate :validate_discount_code
  validate :validate_provider_email

  before_create :create_unique_identifier
  
  attr_accessor :provider_email

  def create_unique_identifier
    self.hashtag = Hashtag.where(discount_code: self.discount_code).first
    begin
      self.code = SecureRandom.hex(8) # or whatever you chose like UUID tools
    end while self.class.exists?(:code => code)

    Notification.referal(self).deliver
  end

  def validate_discount_code
    related_hashtag = Hashtag.where(discount_code: self.discount_code).first
    errors.add(:discount_code, "is invalid") unless related_hashtag 
    if related_hashtag
      errors.add(:discount_code, "is invalid") if related_hashtag.referal_codes.length >= related_hashtag.no_of_referal.to_i
    end
  end

  def validate_provider_email
    related_hashtag = Hashtag.where(discount_code: self.discount_code).first
    errors.add(:provider_email, "is invalid") if related_hashtag && self.provider_email && self.provider_email != related_hashtag.authorized_email    
  end
end
