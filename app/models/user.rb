class User < ApplicationRecord

  has_many :posts
  has_secure_password
  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "300x300" }
  validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user ? @user.authenticate(params[:password]) : false
  end

end
