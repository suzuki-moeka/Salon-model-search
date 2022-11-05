class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reserves
  has_many :customers

  def full_name
    self.first_name + " " + self.last_name
  end
  def full_name_kana
    self.first_name_kana + " " + self.last_name_kana
  end
end
