class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer
  has_many :post_comments, dependent: :destroy

  def full_name
    self.last_name + " " + self.first_name
  end

  def liked_by?(customer)
      likes.exists?(customer_id: customer.id)
  end

  def self.titlelooks(search, word)
    if search == "perfect_match"
      @posts = Post.where("title LIKE ?", "#{word}")
    elsif search == "partial_match"
      @posts = Post.where("title LIKE ?","%#{word}%")
    else
      @posts = Post.all
    end
  end

  def self.postlooks(search, word)
    if search == "perfect_match"
      @posts = Post.where("post LIKE ?", "#{word}")
    elsif search == "partial_match"
      @posts = Post.where("post LIKE ?","%#{word}%")
    else
      @posts = Post.all
    end
  end

end