# frozen_string_literal: true

class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admin_end_user_path(@end_user.id)
    else
      render :edit
    end
  end

  private
    def end_user_params # privateメソッドの名前は、「モデル名_params」とすることが多い
      params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted, :gender, :birthday, :nickname)
    end
end
