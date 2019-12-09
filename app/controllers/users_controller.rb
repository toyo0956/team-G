class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def show
    @users = User.all
  end

  def edit
    @users = User.find(params[:id])
  end

  def destroy
  end
  
end
