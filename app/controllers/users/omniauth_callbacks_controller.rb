class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #include Devise::Controllers::Rememberable
  def hatena
    @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication
        #set_flash_message(:notice, :success, :kind => "Hatena") if is_navigational_format?
      else
        session["devise.hatena_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
  end
=begin
  def hatena
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Hatena") if is_navigational_format?
    else
      session["devise.hatena_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  #def failure
  #  redirect_to root_path
  #end
=end  
end

  # GET|POST /resource/auth/twitter
  def passthru
    super
  end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

=begin
  
  
 
  
  def hatena
    @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))
      if @user.persisted?
        flash.notice = "ログインしました！"
        sign_in_and_redirect @user
      else
        session["devise.user_attributes"] = @user.attributes
        redirect_to root_path
        #redirect_to new_user_registration_url
      end
  end
  
=end

