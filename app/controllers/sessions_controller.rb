class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    @user = User.find_or_create_from_auth_hash(auth)
    session[:uid] = @user.uid
    redirect_to user_articles_path, notice: 'ログインしました'
  end
  
  def destroy
    session[:uid] = nil
    redirect_to root_path
  end
end