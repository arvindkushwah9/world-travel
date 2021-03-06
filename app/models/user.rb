class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :authentications, dependent: :destroy
  mount_uploader :image, ImageUploader
  def is_admin?
    self.role =="admin"
  end

end
