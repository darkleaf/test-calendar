class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, email: true, uniqueness: true

  def guest?
    false
  end

  def to_s
    full_name.presence || email
  end
end
