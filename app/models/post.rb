class Post < ApplicationRecord
    has_many :comments, dependent: :destroy  
    acts_as_votable
end
