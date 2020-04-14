class UsersController < ApplicationController
  before_action :all_users, only: [:index, :create]
  before_action :set_user, only: [:edit, :update, :destroy]
  respond_to :html, :js

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    flash[:success] = "A new user, #{@user.name}, was added to the list"
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
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

    def all_users
      @users = User.all
    end

    def set_user
      @user = User.find(params[:id])
    end

end
