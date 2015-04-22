class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hashtags
  has_many :staffs, class_name: 'Staff', foreign_key: :owner_id
  has_one :associated_staff, class_name: "Staff", foreign_key: :user_id

  has_attached_file :logo
  validates_attachment_file_name :logo, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/]

  def admin?
    self.role == "Resturent Admin"
  end

  def staff?
    self.role == "Staff"
  end
end
