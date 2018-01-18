class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_secure_password

  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "300x300" }
  has_attached_file :avatar, default_url: "profile_pic.png"
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true, length: { maximum: 255 }

  #  add validations for presence (and minimum length) of password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

end
