class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # ユーザーのパスワードとあっていたら
    if user && user.authenticate(params[:password])
      # セッションにアクセスできる データを格納している
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログインに成功しました。"
    else
      flash.now[:alert] = "メールアドレスもしくはパスワードが間違っています。"
      render :new
    end
  end
end
