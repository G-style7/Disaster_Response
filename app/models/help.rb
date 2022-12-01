# frozen_string_literal: true

class Help < ApplicationRecord
  belongs_to :end_user
  belongs_to :post_image
end
