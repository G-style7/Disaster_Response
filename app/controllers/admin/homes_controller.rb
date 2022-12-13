# frozen_string_literal: true

class Admin::HomesController < ApplicationController
  def top
    @post_images = PostImage.page(params[:page])
  end


end
