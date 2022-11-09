class Admin::HomesController < ApplicationController
  def top
    @post_images = PostImage.page(params[:page])
  end

  def tos
  end

  def policy
  end
end
