class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def logout
  end
  
  def show
    @users = User.all
  end

  def edit
    @users = User
  end

  def new
  end

  def destroy
  end
  
  

end
