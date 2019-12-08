class SignupController < ApplicationController

  before_action :save_to_session_step1, only: :step2
  before_action :save_to_session_step2, only: :step3
  before_action :save_to_session_step3, only: :step4

  def step1
    @user = User.new
  end

  def step2
    @user = User.new
  end

  def step3
    @address = Address.new
  end

  def step4

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
    phone_number: session[:phone_number]
    )

    unless @user.save
      reset_session
      redirect_to step1_signup_index_path
    end

    @address = Address.create(
      user: @user,
      postal_code: session[:postal_code],
      prefacture: session[:prefacture],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name]
    )

    if @address.save
      reset_session
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      reset_session
      redirect_to step1_signup_index_path
    end
  end

  def save_to_session_step1
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
  end

  def save_to_session_step2
    session[:phone_number] = user_params[:phone_number]
  end

  def save_to_session_step3
    session[:postal_code] = address_params[:postal_code]
    session[:prefacture] = address_params[:prefacture]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building_name] = address_params[:building_name]
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

    def address_params
      params.require(:address).permit(
        :postal_code,
        :prefacture,
        :city,
        :house_number,
        :building_name
      )
    end
end
