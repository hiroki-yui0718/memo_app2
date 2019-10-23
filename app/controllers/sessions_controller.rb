class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end
  def create
    if user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
      session[:user_id] = user.id
      flash[:success] = "ログインしました"
      redirect_to memos_path
    elsif user = User.find_by(email: session_params[:email])
        if user&.authenticate(session_params[:password])
         session[:user_id] = user.id
         flash[:success] = "ログインしました"
         redirect_to memos_path
      end
    else
      falsh[:danger]="ログインに失敗しました"
      render :new
    end
  end
  def destroy
    reset_session
    flash[:success] ='ログアウトしました'
    redirect_to root_path
  end

  private def session_params
    params.require(:session).permit(
      :email,
      :password,
    )
  end
end
