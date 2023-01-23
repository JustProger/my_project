# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name,
            presence: true, uniqueness: true,
            format: { with: /\A[a-z]+\z/ }

  validates :email,
            presence: true, uniqueness: true,
            email_format: { message: 'invalid email format' }

  validates :password_digest,
            presence: true, confirmation: true
end
