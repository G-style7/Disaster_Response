# frozen_string_literal: true

class Public::SearchesController < ApplicationController
  before_action :authenticate_end_user!

  def search
    @range = params[:range]

    if @range == "address"
      @post_images = PostImage.address_looks(params[:search], params[:word]).page(params[:page])
    else
      @post_images = PostImage.title_looks(params[:search], params[:word]).page(params[:page])
    end
  end
end
