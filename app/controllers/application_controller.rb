class ApplicationController < ActionController::Base
  helper_method :current_user # ビューで使えるようにする

  def login? # ログインしているか確かめるメソッド
    if current_user.nil? # current_userがnilの時
      redirect_to login_path, alert: "ログインしてください。"
    end
  end

  def already_login?
    unless current_user.nil?
      redirect_to user_path, notice: "ログインしています。"
    end
  end

  def current_user
    if session[:user_id]
      current_user ||= User.find(session[:user_id])
    end
  end
end
