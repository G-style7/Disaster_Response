# frozen_string_literal: true

class AddAdressToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :address, :string
    add_column :post_images, :latitude, :float
    add_column :post_images, :longitude, :float
  end
end
