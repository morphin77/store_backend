class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :nickname, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 8 },
            if: -> { new_record? || !password.nil? }

  default_scope {
    select(:name, :surname, :nickname, :email )
  }
end
