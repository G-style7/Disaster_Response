class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.page(params[:page])
  end
end
