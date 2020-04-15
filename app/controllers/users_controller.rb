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
        format.js
      else
        format.html { render :new }
      end
    end

  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.js
      else
        format.html { render :edit }
      end
    end
    
  end

  def destroy
    gone_user = @user.name
    respond_to do |format|
      @user.destroy ? format.js : format.html { render :index }
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :title, :phone, :status)
    end

    def set_user
      @user = User.find(params[:id])
    end

end
