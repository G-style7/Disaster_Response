class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :helps, dependent: :destroy
  has_many :help_post_images, through: :helps, source: :post_image
  #sourceは元のモデルが何かを示している（help_post_imagesのテーブルはないため。記述ない場合エラーになる）
  
  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  # フォローしたときの処理
def follow(end_user_id)
  relationships.create(followed_id: end_user_id)
end
# フォローを外すときの処理
def unfollow(end_user_id)
  relationships.find_by(followed_id: end_user_id).destroy
end
# フォローしているか判定
def following?(end_user)
  followings.include?(end_user)
end

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

  def self.looks(search, word)
    if search == "perfect_match"
      @end_user = EndUser.where("address LIKE?", "#{word}")
    elsif search == "forward_match"
      @end_user = EndUser.where("address LIKE?","#{word}%")
    elsif search == "backward_match"
      @end_user = EndUser.where("address LIKE?","%#{word}")
    elsif search == "partial_match"
      @end_user = EndUser.where("address LIKE?","%#{word}%")
    else
      @end_user = EndUser.all
    end
  end
end
