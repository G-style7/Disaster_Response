class ApplicationController < ActionController::Base
  DISASTER_ARRAY = [["地震"],["津波"],["風水害(台風、洪水)"],["竜巻"],["火山爆発、火砕流"],["干ばつ"],["その他"]]

  def after_sign_out_path_for(resource)
    root_path
  end
end
