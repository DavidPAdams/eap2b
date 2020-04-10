class UsersController < ApplicationController

  def index
    @users = User.all.latest_updated
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
