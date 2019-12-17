class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def logout
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @users = User
  end

  def new
  end

  def destroy
  end

  def profile
    @user = User.find(params[:id])
  end
  
  def userinfo
    @user = User.find(params[:id])
  end
  

end
