class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_users, only: [:index, :create, :update]
  helper_method :sort_column, :sort_direction

  def index
    @user = User.new 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success] = "User #{@user.name} was successfully added."
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    puts @user.name
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User #{@user.name} was successfully updated."
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    gone_user = @user
    @user.destroy
    flash[:danger] = "User #{gone_user.name} was deleted."
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
