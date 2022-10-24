class PostImage < ApplicationRecord
  has_one_attached :image

  belongs_to :end_user
  has_many :post_comments, dependent: :destroy
  has_many :helps, dependent: :destroy
  
end
