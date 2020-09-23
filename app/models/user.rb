class User < ApplicationRecord
  with_options presence: true do
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]*\z/.freeze
      
    validates  :nickname
    validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'is invalid. Input half-width English numbers and letters.' }
    end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
