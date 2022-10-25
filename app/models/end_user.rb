class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :helps, dependent: :destroy
  
  enum gender: { man: 0, woman: 1, other: 2 }
end
