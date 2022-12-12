# frozen_string_literal: true

class PostComment < ApplicationRecord
  validates :comment, presence: true

  belongs_to :end_user
  belongs_to :post_image
end
