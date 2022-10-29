class PostImage < ApplicationRecord
  DISASTER_ARRAY = ["地震","津波","風水害(台風、洪水)","竜巻","火山爆発、火砕流","干ばつ","その他"]
  validates :kind ,inclusion: { in: DISASTER_ARRAY }

  has_one_attached :image

  belongs_to :end_user
  has_many :post_comments, dependent: :destroy
  has_many :helps, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
