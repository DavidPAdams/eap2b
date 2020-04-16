class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_users, only: [:index]
  helper_method :sort_column, :sort_direction

  def index
    @user = User.new 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to root_url
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    redirect_to root_url
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :title, :phone, :status)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def set_users
      @users = User.order(sort_column + " " + sort_direction).paginate(page: params[:page])
    end

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end

end
