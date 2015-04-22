class AuthorizedEmail < ActiveRecord::Base
  belongs_to :hashtag

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
