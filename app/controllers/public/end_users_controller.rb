# frozen_string_literal: true

class Public::EndUsersController < ApplicationController
  def show
    @end_user = current_end_user
    @post_images = @end_user.post_images
  end

  def edit
    @end_user = current_end_user
  end

  def helps
    @post_images = current_end_user.help_post_images.page(params[:page])
  end

  def update
    @end_user = current_end_user
    if @end_user.update(end_user_params)
      redirect_to end_users_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe # 退会確認
  end

  def withdraw # 退会処理
    @end_user = current_end_user
    if @end_user.update(is_deleted: true) # 左の書き方はis_deletedをtrueにさせる　bookers2では@book.update(book_params)と記述していたため、ストロングパラメータの内容をupdateさせていた
      reset_session  # ログイン状態を解除する
      flash[:notice] = "退会処理を実行いたしました" # viewに記述しないと反映されない
      redirect_to root_path
    else
      render :show
    end
  end

  private
    def end_user_params
      params.require(:end_user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :birthday, :postal_code, :telephone_number, :profile_image)
    end
end
