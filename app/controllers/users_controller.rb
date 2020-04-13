class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

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
    gone_user = @user.name
    @user.destroy
    flash[:success] = "#{gone_user} was deleted from the list"
    
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :title, :status)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
