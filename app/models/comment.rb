class Comment < ApplicationRecord
    validates :post, presence: true 
    validates :author, presence: true
    validates :content, presence: true 
end
