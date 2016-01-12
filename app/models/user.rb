class User < ActiveRecord::Base
  has_secure_password

  def guest?
    false
  end
end
