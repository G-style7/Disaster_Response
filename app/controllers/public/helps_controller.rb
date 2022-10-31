class Public::HelpsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    help = current_end_user.helps.new(post_image_id: post_image.id)
    help.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    help = current_end_user.helps.find_by(post_image_id: post_image.id)
    help.destroy
    redirect_to post_image_path(post_image)
  end
end
