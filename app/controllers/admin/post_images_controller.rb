# frozen_string_literal: true

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

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to admin_post_images_path
  end
end
