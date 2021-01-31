class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # ユーザーのパスワードとあっていたら
    if user && user.authenticate(params[:password])
      # セッションにアクセスできる データを格納している cookieに保存されている
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログインに成功しました。"
    else
      flash.now[:alert] = "メールアドレスもしくはパスワードが間違っています。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトに成功しました。"
  end
end
