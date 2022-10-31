class ApplicationController < ActionController::Base
  DISASTER_ARRAY = [["地震"],["津波"],["風水害(台風、洪水)"],["竜巻"],["火山爆発、火砕流"],["干ばつ"],["その他"]]
  #Log_inしていない場合、topページと新規登録以外遷移できない設定
  before_action :authenticate_end_user!, except: [:top]

  def after_sign_out_path_for(resource)
    root_path
  end
end
