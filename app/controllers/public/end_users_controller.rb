class Public::EndUsersController < ApplicationController
  def show
    @end_user = current_end_user
    @post_images = @end_user.post_images
  end

  def edit
  end

  def update
  end
end
