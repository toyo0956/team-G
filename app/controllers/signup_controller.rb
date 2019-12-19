class SignupController < ApplicationController

  require 'payjp'
  
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
    @card = Card.new
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in? 
  end

  #一括保存
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
    birthdate_day: session[:birthdate_day]
    )

    unless @user.save
      reset_session
      redirect_to step1_signup_index_path
    end

    if session[:provider].present?
      @snscredential = SnsCredential.create(
        user: @user,
        uid: session[:uid],
        provider: session[:provider]
      )
  end

    @address = Address.create(
      user: @user,
      postal_code: session[:postal_code],
      prefecture_id: session[:prefecture_id],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name],
      phone_number: session[:phone_number]
    )
    Payjp.api_key = ""
    customer = Payjp::Customer.create(card: params['payjp-token'])
    @card = Card.new(
      user: @user,
      customer_id: customer.id,
      card_id: customer.default_card
    )

    if @card.save
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
    if session[:provider].blank?
      session[:password] = user_params[:password]
      session[:password_confirmation] = user_params[:password_confirmation]
    end
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthdate_year] = user_params[:birthdate_year]
    session[:birthdate_month] = user_params[:birthdate_month]
    session[:birthdate_day] = user_params[:birthdate_day]
    redirect_to step2_signup_index_path
  end

  def save_to_session_step2
    #session[:phone_number] = user_params[:phone_number]
    redirect_to step3_signup_index_path
  end

  def save_to_session_step3
    session[:postal_code] = address_params[:postal_code]
    session[:prefecture_id] = address_params[:prefecture_id]
    session[:city] = address_params[:city]
    session[:house_number] = address_params[:house_number]
    session[:building_name] = address_params[:building_name]
    session[:phone_number] = address_params[:phone_number]
    redirect_to step4_signup_index_path
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
        :birthdate_day
      )
    end

    def address_params
      params.require(:address).permit(
        :postal_code,
        :prefecture_id,
        :city,
        :house_number,
        :building_name,
        :phone_number
      )
    end

end
