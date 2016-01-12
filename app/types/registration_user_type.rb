class RegistrationUserType < User
  include BaseType

  validates :password, presence: true
  validates :password_confirmation, presence: true
end
