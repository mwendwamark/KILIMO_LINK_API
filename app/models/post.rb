# app/models/post.rb
class Post < ApplicationRecord
  # Relationships
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
