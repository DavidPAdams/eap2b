class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all.latest_updated.paginate(page: params[:page])
    @user = User.new    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: "#{@user.name} was added to the users list"}
        format.js
      else
        format.html { render :new }
      end
    end

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

    def set_user
      @user = User.find(params[:id])
    end

end
