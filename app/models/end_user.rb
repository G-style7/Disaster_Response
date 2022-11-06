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

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
