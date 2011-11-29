class HomeController < ApplicationController
  def index
    if @current_user
      @users = User.all
      @users.delete current_user

      # FIXME(Jon): Change to friends' posts, sorted by time
      @posts = @current_user.posts
      render :index
    else
      render :index_logged_out
    end
  end

  def login
  end

end
