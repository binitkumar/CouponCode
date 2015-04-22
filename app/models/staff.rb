class Staff < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  attr_accessor :email

  validates_presence_of :email, :owner_id

  before_create :invite_associated_user

  def invite_associated_user
    staff_user = User.find_by_email self.email
    staff_user = User.invite!(:email => self.email, :role => "Staff") unless staff_user

    self.user = staff_user
  end
end
