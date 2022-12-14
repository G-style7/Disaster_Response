# frozen_string_literal: true

class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :post_image_id, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
