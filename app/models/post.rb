# frozen_string_literal: true

class Post < ApplicationRecord
  paginates_per 3

  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
