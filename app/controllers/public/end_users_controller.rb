class Public::EndUsersController < ApplicationController
  def show
    @end_user = current_end_user
    @post_images = @end_user.post_images
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    @end_user.update(end_user_params)
    redirect_to end_users_my_page_path
  end
end

  private

  def end_user_params
    params.require(:end_user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :birthday, :postal_code, :telephone_number)
  end