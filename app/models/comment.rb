class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  acts_as_votable
  validates :body, presence: true, allow_blank: false
end
