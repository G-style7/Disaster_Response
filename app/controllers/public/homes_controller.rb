# frozen_string_literal: true

class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.page(params[:page]).all.order(created_at: :desc)
  end
  
  def tos
  end

  def policy
  end
end

# unless signed_in?
#       # ログインページに遷移
#       redirect_to new_end_user_session_path
#     end
