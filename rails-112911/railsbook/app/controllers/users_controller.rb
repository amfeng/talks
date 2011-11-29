class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :except => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end

  def friend
    friend = User.find(params[:friend_id]) rescue nil
    if friend and @current_user.add_friend friend
      flash[:notice] = "You are now friends with #{friend.name}"
    else
    end

    redirect_back_or_default home_path
  end

  def unfriend
    friend = User.find(params[:friend_id]) rescue nil
    if friend and @current_user.unfriend friend
      flash[:notice] = "You are no longer friends with #{friend.name}"
    else
    end

    redirect_back_or_default home_path
  end
end
