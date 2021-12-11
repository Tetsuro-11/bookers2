class Book < ApplicationRecord
    belongs_to :user
    validates :title, presence: true
    validates :body, length: {minimum:2, maximum: 200}
    validates :body, presence: true
end
