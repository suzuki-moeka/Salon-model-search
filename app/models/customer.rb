class Customer < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :post_comments, dependent: :destroy
  has_many :reserves

  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.password_confirmation = customer.password
      customer.last_name = 'サンプル'
      customer.first_name = '太郎'
      customer.last_name_kana = 'サンプル'
      customer.first_name_kana = 'タロウ'
      customer.postcode = '0000000'
      customer.address = '東京都千代田区永田町1－7－1'
      customer.phone_number = '00000000000'
    end
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def full_name_kana
    "#{last_name_kana} #{first_name_kana}"
  end
end
