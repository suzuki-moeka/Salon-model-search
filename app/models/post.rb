class Post < ApplicationRecord
  has_many_attached :images
  belongs_to :customer
  has_many :likes, dependent: :destroy
  has_many :liked_customers, through: :likes, source: :customer
  has_many :post_comments, dependent: :destroy

  def full_name
    "#{last_name} #{first_name}"
  end

  def liked_by?(customer)
      likes.exists?(customer_id: customer.id)
  end

  def self.titlelooks(search, word)
    case search
    when "perfect_match"
      where("title LIKE ?", "#{word}")
    when "partial_match"
      where("title LIKE ?","%#{word}%")
    else
      all
    end
  end

  def self.postlooks(search, word)
    case search
    when "perfect_match"
      where("post LIKE ?", "#{word}")
    when "partial_match"
      where("post LIKE ?","%#{word}%")
    else
      all
    end
  end

  def self.search(search_word)
    Post.where(['category LIKE ?', "#{search_word}"])
  end

end