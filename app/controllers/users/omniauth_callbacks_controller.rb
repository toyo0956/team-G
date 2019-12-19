# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    info = User.from_omniauth(request.env['omniauth.auth'])
    @user = info[0]
    @snscredential = info[1]
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session[:nickname] = @user.nickname
      session[:email] = @user.email
      session[:password] = @user.password
      session[:uid] = @snscredential.uid
      session[:provider] = @snscredential.provider
      redirect_to step1_signup_index_path
    end
  end
end
