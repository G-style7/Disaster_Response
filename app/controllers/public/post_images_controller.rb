# frozen_string_literal: true

class Public::PostImagesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :correct_user, only: [:edit, :update]

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.end_user_id = current_end_user.id
    @post_image.address = Geocoder.search([@post_image.latitude, @post_image.longitude]).first.address
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = current_end_user.post_images.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    # @latitude =
    # @longitude =
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to post_image_path
  end

   private
     def post_image_params
       params.require(:post_image).permit(:title, :kind, :introduction, :address, :latitude, :longitude, :image)
     end

     def correct_user
     @post_image = PostImage.find(params[:id])
     @end_user = @post_image.end_user #⬆️の投稿をしたUserであると定義
     redirect_to(post_image_path) unless @end_user == current_end_user
     #②で定義したend_userと現在ログインしているend_userが一致していなければ、一覧ページにリダイレクトされる
  end
end
