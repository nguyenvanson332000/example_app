class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true,
                   length: { maximum: Settings.model.user.name_length_max }
  validates :email, format: { with: Settings.email_regex },
                    length: { maximum: Settings.model.user.email_length_max },
                    uniqueness: { case_sensitive: false },
                    presence: true
  has_secure_password
  validates :password, length: { minimum: Settings.model.user.password_length_min }
end
