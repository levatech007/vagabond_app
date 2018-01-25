class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    post.user == user
  end

  def destroy?
    user.present? && user == post.user
  end

end
