class ReferalCode < ActiveRecord::Base
  belongs_to :hashtag

  validate :validate_discount_code
  validate :validate_provider_email

  before_create :create_unique_identifier
  
  attr_accessor :provider_email, :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end

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
    errors.all(:discount_code, "is invalid") unless related_hashtag
    
    if related_hashtag && self.full_name
      errors.add(:first_name, "is invalid") unless related_hashtag.authorized_emails.collect(&:full_name).include?(self.full_name)    
      errors.add(:last_name, "is invalid") unless related_hashtag.authorized_emails.collect(&:full_name).include?(self.full_name)    
    end
  end
end
