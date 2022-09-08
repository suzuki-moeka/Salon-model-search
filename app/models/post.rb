class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer

  def self.looks(search, word)
    if search == "perfect_match"
      @posts = Post.where("title LIKE ?", "#{word}")
    elsif search == "partial_match"
      @posts = Post.where("title LIKE ?","%#{word}%")
    else
      @posts = Post.all
    end
  end
end