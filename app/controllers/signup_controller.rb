class SignupController < ApplicationController
  def step1
    @user = User.new
  end

  def step2
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    @user = User.new
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  def create
    @user = User.new(
    nickname: session[:nickname],
    email: session[:email],
    password: session[:password],
    password_confirmation: session[:password_confirmation],
    family_name: session[:family_name],
    first_name: session[:first_name],
    family_name_kana: session[:family_name_kana],
    first_name_kana: session[:first_name_kana],
    birthdate_year: session[:birthdate_year],
    birthdate_month: session[:birthdate_month],
    birthdate_day: session[:birthdate_day],
    phone_number: user_params[:phone_number]
    )

    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      reset_session
      redirect_to step1_signup_index_path
    end
  end

  private
  
    def user_params
      params.require(:user).permit(
        :nickname,
        :email,
        :password,
        :password_confirmation,
        :family_name,
        :first_name,
        :family_name_kana,
        :first_name_kana,
        :birthdate_year,
        :birthdate_month,
        :birthdate_day,
        :phone_number
      )
    end
end
