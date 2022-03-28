class SessionsController < ApplicationController
  def new
  end

  def create
    session_params = params[:session]
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user&.authenticate(params[:session][:password])
      check_activated @user
    else
      flash[:danger] = t "controller.session.flash_danger"
      render :new
    end
  end

  def login(user)
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_back_or user
  end

  def check_activated(user)
    if user.activated
      log_in user
      redirect_back_or user
    else
      flash[:warning] = t "controller.session.flash_warning"
      edirect_to root_url
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
