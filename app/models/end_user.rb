class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :helps, dependent: :destroy
  
  #重複していないemailであるか（一意性、ユニーク (uniqueness)とは、誰かまたは何かが他のものと比較して異なる状態または状態のこと。）
  validates :email, uniqueness: true
  validates :last_name,:first_name,:last_name_kana,:first_name_kana,:birthday,:gender,:nickname,:postal_code,:address,:telephone_number, presence: true



  enum gender: { man: 0, woman: 1, other: 2 }

  def full_name
    last_name+first_name
  end

  def full_name_kana
    last_name_kana+first_name_kana
  end
end
