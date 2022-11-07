class Admin::PostImagesController < ApplicationController
  def index
    if params[:end_user_id]
      @post_images = PostImage.where(end_user_id: params[:end_user_id]).page(params[:page])
    else
      @post_images = PostImage.page(params[:page])
    end
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.all
  end
end
