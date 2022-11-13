class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    @range = params[:range]

    if @range == "End_User"
      @end_users = EndUser.looks(params[:search], params[:word]).page(params[:page])
    else
      @post_images = PostImage.looks(params[:search], params[:word]).page(params[:page])
    end
  end
end
