class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    load_user_or_redirect
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "controller.user.flash_success"
      redirect_to @user
    else
      render :new
    end
  end

  def update
    load_user_or_redirect
    if @user.update user_params
      flash[:success] = t "controller.user.profile_success"
      redirect_to @user
    else
      flash[:warning] = t "controller.user.profile_success"
      render :edit
    end
  end

  def edit
    load_user_or_redirect
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end

  def load_user_or_redirect
    @user = User.find_by id: params[:id]
    return if @user.present?

    flash[:warning] = t "controller.user.not_found"
    redirect_to login_url
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "controller.user.login"
    redirect_to login_url
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
