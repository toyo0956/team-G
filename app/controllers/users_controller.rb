class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def show
  end

  def edit
    @users = User.all
  end

  def destroy
  end
end
