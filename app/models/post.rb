class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  validates :title, presence: true
  validates :post, presence: true

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

  def save_tags(tags)
    tag_list = tags.split(/[[:blank:]]+/)
    current_tags = self.tags.pluck(:name)
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags
    p current_tags
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
    end
  end


end