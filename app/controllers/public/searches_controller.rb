class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    @range = params[:range]

    if @range == "End_User"
      @users = End_User.looks(params[:search], params[:word])
    else
      @books = Post_Image.looks(params[:search], params[:word])
    end
  end
end
